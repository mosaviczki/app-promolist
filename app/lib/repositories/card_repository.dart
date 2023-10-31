import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projeto_dispositivos_moveis/database/db_firestore.dart';
import 'package:projeto_dispositivos_moveis/model/cards_model.dart';
import 'package:projeto_dispositivos_moveis/model/item_model.dart';
import 'package:projeto_dispositivos_moveis/services/auth_service.dart';

class CardRepository extends ChangeNotifier {
  final List<CardsModel> _lista = [];
  final List<CardsModel> _historico = [];
  late FirebaseFirestore db;
  late AuthService auth;
  UnmodifiableListView<CardsModel> get lista => UnmodifiableListView(_lista);
  UnmodifiableListView<CardsModel> get historico =>
      UnmodifiableListView(_historico);
  CardRepository({required this.auth}) {
    _startRepository();
  }

  _startRepository() async {
    await _startFirestore();
    await _readCards();
    await _readHistory();
  }

  _startFirestore() {
    db = DBFirestore.get();
  }

  saveAll(List<CardsModel> cards) async {
    for (var card in cards) {
      if (!_lista.contains(card)) {
        _lista.add(card);
        await db
            .collection('users/${auth.usuario!.uid}/cards')
            .doc(cards[0].titulo)
            .set(card.toMap());
      }
    }
    notifyListeners();
  }

  _readCards() async {
    if (auth.usuario != null && lista.isEmpty) {
      print('carregou lista do bd');
      final snapshot =
          await db.collection('users/${auth.usuario!.uid}/cards').get();
      snapshot.docs.forEach((doc) {
        _addCardToList(doc);
        notifyListeners();
      });
    }
  }

  _readHistory() async {
    if (auth.usuario != null && historico.isEmpty) {
      print('carregou historico do bd');
      final snapshot =
          await db.collection('users/${auth.usuario!.uid}/historico').get();
      snapshot.docs.forEach((doc) {
        _addCardToHistory(doc);
        notifyListeners();
      });
    }
  }

  _addCardToList(QueryDocumentSnapshot doc) {
    CardsModel card = CardsModel(
        titulo: _getDocTitle(doc), listaItens: _getDocListItens(doc));
    _lista.add(card);
  }

  _addCardToHistory(QueryDocumentSnapshot doc) {
    CardsModel card = CardsModel(
        titulo: _getDocTitle(doc), listaItens: _getDocListItens(doc));
    _historico.add(card);
  }

  _getDocTitle(QueryDocumentSnapshot doc) {
    return doc.get('titulo');
  }

  _getDocListItens(QueryDocumentSnapshot doc) {
    List<dynamic> lista = doc.get('listaItens');
    List<ItemModel> listaItens = [];

    lista.forEach((item) {
      ItemModel itemParaAdicionar =
          ItemModel(nome: item['nome'], quantidade: item['quantidade']);
      listaItens.add(itemParaAdicionar);
    });
    return listaItens;
  }

  remove(CardsModel card) async {
    await db
        .collection('users/${auth.usuario!.uid}/cards')
        .doc(card.titulo)
        .delete();
    _lista.remove(card);
    notifyListeners();
  }

  removeAndMoveToHistory(CardsModel card) async {
    await db
        .collection('users/${auth.usuario!.uid}/cards')
        .doc(card.titulo)
        .delete();
    saveHistory(card);
    _lista.remove(card);
    notifyListeners();
  }

  saveHistory(CardsModel card) async {
    await db
        .collection('users/${auth.usuario!.uid}/historico')
        .doc(card.titulo)
        .set(card.toMap());
    _historico.add(card);
    notifyListeners();
  }
}
