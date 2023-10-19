import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:projeto_dispositivos_moveis/model/cards_model.dart';


class CardRepository extends ChangeNotifier {
  final List<CardsModel> _lista = [];

  UnmodifiableListView<CardsModel> get lista => UnmodifiableListView(_lista);

  saveAll(List<CardsModel> cards) {
    for (var card in cards) {
      if (!_lista.contains(card)) _lista.add(card);
    }
    notifyListeners();
  }

  remove(CardsModel card) {
    _lista.remove(card);
    notifyListeners();
  }
}
