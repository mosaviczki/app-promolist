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
        AddressModel addresses = lista
            .firstWhere((addresses) => addresses.zipcode == doc.get('address'));
        _lista.add(addresses);
        notifyListeners();
      });
    }
  }

  UnmodifiableListView<AddressModel> get lista => UnmodifiableListView(_lista);

  saveAll(List<AddressModel> address) {
    address.forEach((add) async {
      if (!_lista.contains(add)) {
        _lista.add(add);
        await db
            .collection('users/${auth.usuario!.uid}/myAddress')
            .doc(add.address)
            .set({
          'address': add.address,
          'number': add.number,
          'complement': add.complement,
          'city': add.city,
          'state': add.uf,
          'zipcode': add.zipcode,
        });
      }
    });
  }

  removeAll() async {
    var snapshot =
        await db.collection('users/${auth.usuario!.uid}/myAddresses').get();
    snapshot.docs.forEach((doc) {
      print('Doc: ${doc.reference}');
      doc.reference.delete();
    });
    _lista.removeAt(0);
    notifyListeners();
  }
}
