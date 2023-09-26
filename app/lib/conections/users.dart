import 'package:flutter/material.dart';

class UserRepository extends ChangeNotifier {
  // ignore: unused_field
  final List<Users> _users = [
    Users(nome: 'Weiry', telefone: '(42)997865050', email: 'weiry@email.com'),
    Users(
        nome: 'Guilherme',
        telefone: '(42)999887766',
        email: 'guilherme@email.com'),
    Users(
        nome: 'Monique', telefone: '(42)997193344', email: 'monique@email.com'),
  ];

  List<Users> get users => _users;
}

class Users {
  String nome;
  String telefone;
  String email;

  Users({required this.nome, required this.telefone, required this.email});
}
