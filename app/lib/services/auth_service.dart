import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projeto_dispositivos_moveis/database/db_firestore.dart';

class AuthException implements Exception {
  String message;
  AuthException(this.message);
}

class AuthService extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? usuario;
  bool isLoading = true;
  late FirebaseFirestore db;

  AuthService() {
    _authCheck();
  }

  _authCheck() {
    _auth.authStateChanges().listen((User? user) {
      usuario = (user == null) ? null : user;
      isLoading = false;
      notifyListeners();
    });
  }

  _getUser() {
    usuario = _auth.currentUser;
    notifyListeners();
  }

  register(String email, String senha, String nome) async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: senha)
          .then((UserCredential userCredential) {
        userCredential.user!.updateDisplayName(nome);
      });
      _getUser();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw AuthException("A senha é muito fraca!");
      } else if (e.code == 'email-already-in-use') {
        throw AuthException("Esse email já esta cadastrado");
      }
    }
  }

  _startFirestore() {
    db = DBFirestore.get();
  }

  login(String email, String senha) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: senha);
      _getUser();
    } on FirebaseAuthException catch (e) {
      print(e.code);
      if (e.code == 'INVALID_LOGIN_CREDENTIALS') {
        throw AuthException("Email e/ou senha incorreta");
      }
    }
  }

  logout() async {
    await _auth.signOut();
    _getUser();
  }
}
