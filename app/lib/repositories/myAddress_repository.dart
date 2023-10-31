import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projeto_dispositivos_moveis/database/db_firestore.dart';
import 'package:projeto_dispositivos_moveis/model/address_model.dart';
import 'package:projeto_dispositivos_moveis/services/auth_service.dart';

class MyAddressRepository extends ChangeNotifier {
  List<AddressModel> _lista = [];
  late FirebaseFirestore db;
  late AuthService auth;

  MyAddressRepository({required this.auth}) {
    _startRepository();
  }

  _startRepository() async {
    await _startFirestore();
    await _readMyAddress();
  }

  _startFirestore() {
    db = DBFirestore.get();
  }

  _readMyAddress() async {
    if (auth.usuario != null && _lista.isEmpty) {
      final snapshot =
          await db.collection('users/${auth.usuario!.uid}/myAddress').get();
      snapshot.docs.forEach((doc) {
        AddressModel addresses = AddressModel(
            zipcode: doc.get('zipcode'),
            address: doc.get('address'),
            number: doc.get('number'),
            city: doc.get('city'),
            uf: doc.get('state'),
            complement: doc.get('complement'));
        _lista.add(addresses);
        notifyListeners();
      });
    }
  }

  UnmodifiableListView<AddressModel> get lista => UnmodifiableListView(_lista);

  saveAll(AddressModel address) async {
    if (!_lista.contains(address)) {
      _lista.add(address);
      await db
          .collection('users/${auth.usuario!.uid}/myAddress')
          .doc(address.address)
          .set({
        'address': address.address,
        'number': address.number,
        'complement': address.complement,
        'city': address.city,
        'state': address.uf,
        'zipcode': address.zipcode,
      });
      notifyListeners();
    }
  }

  update(AddressModel address) async {
    if (!_lista.contains(address)) {
      await db
          .collection('users/${auth.usuario!.uid}/myAddress')
          .doc(_lista[0].address)
          .delete();
      _lista.remove(_lista.first);
      await db
          .collection('users/${auth.usuario!.uid}/myAddress')
          .doc(address.address)
          .set({
        'address': address.address,
        'number': address.number,
        'complement': address.complement,
        'city': address.city,
        'state': address.uf,
        'zipcode': address.zipcode,
      });
      _lista.add(address);
      notifyListeners();
    }
  }
}
