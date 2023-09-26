import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projeto_dispositivos_moveis/conections/users.dart';
import 'package:projeto_dispositivos_moveis/pages/initial_page.dart';
import 'package:projeto_dispositivos_moveis/pages/privacy_page.dart';
import 'package:projeto_dispositivos_moveis/pages/terms_page.dart';
import 'package:projeto_dispositivos_moveis/services/auth_service.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String nome = '';
  String email = '';

  carregarDados() {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    User? usuario = _auth.currentUser;
    final users = UserRepository().users;
    // ignore: avoid_function_literals_in_foreach_calls
    users.forEach((user) {
      if (user.email == usuario?.email) {
        setState(() {
          nome = user.nome;
          email = user.email;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    carregarDados();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(
        top: 40,
        left: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Perfil',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins',
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          ListTile(
            leading: const Icon(
              Icons.person,
              size: 80,
              color: Colors.black,
            ),
            title: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 5),
                  child: Text(nome),
                ),
              ],
            ),
            subtitle: Material(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 5),
                    child: Text(email),
                  ),
                ],
              ),
            ),
            contentPadding: const EdgeInsets.only(top: 5),
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            'Configurações',
            style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 22,
                fontWeight: FontWeight.w600),
          ),
          const ListTile(
            leading: Icon(Icons.person_outline_rounded, color: Colors.black),
            title: Text('Informações pessoais'),
            trailing: Icon(
              Icons.chevron_right,
              color: Colors.black,
              size: 30,
            ),
            contentPadding: EdgeInsets.only(top: 5, right: 15),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 25),
            child: Divider(
              height: 1,
              thickness: 2,
            ),
          ),
          const ListTile(
            leading: Icon(Icons.security_outlined, color: Colors.black),
            title: Text('Login e Segurança'),
            trailing: Icon(
              Icons.chevron_right,
              color: Colors.black,
              size: 30,
            ),
            contentPadding: EdgeInsets.only(top: 2, right: 15),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 25, bottom: 20),
            child: Divider(
              height: 1,
              thickness: 2,
            ),
          ),
          ListTile(
            leading: Image.asset("assets/terms_icon.png"),
            title: const Text('Termos de uso'),
            trailing: const Icon(
              Icons.chevron_right,
              color: Colors.black,
              size: 30,
            ),
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const TermsPage())),
            contentPadding: const EdgeInsets.only(top: 5, right: 15),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 25),
            child: Divider(
              height: 1,
              thickness: 2,
            ),
          ),
          ListTile(
            leading: Image.asset("assets/terms_icon.png"),
            title: const Text('Política de privacidade'),
            trailing: const Icon(
              Icons.chevron_right,
              color: Colors.black,
              size: 30,
            ),
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const PrivacyPage())),
            contentPadding: const EdgeInsets.only(top: 5, right: 15),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 25),
            child: Divider(
              height: 1,
              thickness: 2,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextButton.icon(
            onPressed: () {
              AuthService().logout();
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => InitialPage()));
            },
            icon: const Icon(
              Icons.exit_to_app,
              color: Colors.black,
            ),
            label: const Text(
              'Sair',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    ));
  }
}
