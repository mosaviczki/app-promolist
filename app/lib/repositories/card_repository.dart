import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projeto_dispositivos_moveis/database/db_firestore.dart';
import 'package:projeto_dispositivos_moveis/model/cards_model.dart';
import 'package:projeto_dispositivos_moveis/model/item_model.dart';
import 'package:projeto_dispositivos_moveis/services/auth_service.dart';

class CardRepository extends ChangeNotifier {
  final List<CardsModel> _lista = [];
  late FirebaseFirestore db;
  late AuthService auth;
  UnmodifiableListView<CardsModel> get lista => UnmodifiableListView(_lista);

  CardRepository({required this.auth}) {
    _startRepository();
  }

  _startRepository() async {
    await _startFirestore();
    await _readCards();
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
            .doc()
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

  _addCardToList(QueryDocumentSnapshot doc) {
    CardsModel card = CardsModel(
        titulo: _getDocTitle(doc), listaItens: _getDocListItens(doc));
    _lista.add(card);
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

  remove(CardsModel card) {
    _lista.remove(card);
    notifyListeners();
  }
}
