import 'dart:collection';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projeto_dispositivos_moveis/database/db_firestore.dart';
import 'package:projeto_dispositivos_moveis/model/address_model.dart';
import 'package:projeto_dispositivos_moveis/services/auth_service.dart';

class AddressRepository extends ChangeNotifier {
  List<AddressModel> _lista = [];
  late FirebaseFirestore db;
  late AuthService auth;

  AddressRepository({required this.auth}) {
    _startRepository();
  }

  _startRepository() async {
    await _startFirestore();
    await _readAddress();
  }

  _startFirestore() {
    db = DBFirestore.get();
  }

  _readAddress() async {
    if (auth.usuario != null && _lista.isEmpty) {
      final snapshot =
          await db.collection('users/${auth.usuario!.uid}/addresses').get();
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

  saveAll(List<AddressModel> addresses) {
    addresses.forEach((add) async {
      if (!_lista.contains(add)) {
        _lista.add(add);
        await db
            .collection('users/${auth.usuario!.uid}/addresses')
            .doc(add.address)
            .set({
          'address': add.address,
          'zipcode': add.zipcode,
          'number': add.number,
          'complement': add.complement,
          'city': add.city,
          'state': add.uf,
        });
      }
      notifyListeners();
    });
  }

  remove(AddressModel address, List<AddressModel> myAddressList,
      BuildContext context) async {
    if (address == myAddressList[0]) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Não é possivel excluir endereço principal!'),
          backgroundColor: Colors.red));
    } else {
      await db
          .collection('users/${auth.usuario!.uid}/addresses')
          .doc(address.address)
          .delete();
      _lista.remove(address);
      notifyListeners();
    }
  }
}
