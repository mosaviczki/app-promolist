import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projeto_dispositivos_moveis/components/maps.dart';
import 'package:projeto_dispositivos_moveis/pages/initial_page.dart';
import 'package:projeto_dispositivos_moveis/pages/main_page.dart';
import 'package:projeto_dispositivos_moveis/services/auth_service.dart';
import 'package:provider/provider.dart';

class AuthCheck extends StatefulWidget {
  const AuthCheck({super.key});

  @override
  State<AuthCheck> createState() => _AuthCheckState();
}

class _AuthCheckState extends State<AuthCheck> {
  @override
  Widget build(BuildContext context) {
    AuthService auth = Provider.of<AuthService>(context);

    if (auth.isLoading) {
      return loading();
    } else if (auth.usuario == null) {
      print(auth.usuario);
      return const InitialPage();
    } else {
      print(auth.usuario);
      return const MainPage();
    }
  }

  loading() {
    return const Scaffold(
        body: Center(
      child: CircularProgressIndicator(),
    ));
  }
}
