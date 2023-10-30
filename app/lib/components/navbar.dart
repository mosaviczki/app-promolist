import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projeto_dispositivos_moveis/pages/list_card_pages/history_page.dart';
import 'package:projeto_dispositivos_moveis/pages/initial_page.dart';
import 'package:projeto_dispositivos_moveis/pages/list_card_pages/list_card_page.dart';
import 'package:projeto_dispositivos_moveis/pages/profile_pages/profile_page.dart';
import 'package:projeto_dispositivos_moveis/repositories/user_repository.dart';
import 'package:projeto_dispositivos_moveis/services/auth_service.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  String nome = '';
  String email = '';

  carregarDados() {
    // ignore: no_leading_underscores_for_local_identifiers
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
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(nome),
            accountEmail: Text(email),
            currentAccountPicture: const ClipOval(
              child: Icon(
                Icons.person,
                size: 70,
              ),
            ),
            decoration: const BoxDecoration(color: Colors.blue),
          ),
          ListTile(
            leading: const Icon(
              Icons.home,
            ),
            title: const Text('Home'),
            onTap: () => Navigator.pop(context),
            selectedColor: Colors.black,
            selected: true,
          ),
          ListTile(
            leading: const Icon(
              Icons.shopping_cart,
            ),
            title: const Text('Listas de compra'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ListCardPage(),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.history,
            ),
            title: const Text('Histórico'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HistoryPage(),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.person,
            ),
            title: const Text('Perfil'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ProfilePage(),
              ),
            ),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(
              Icons.exit_to_app,
            ),
            title: const Text('Sair'),
            onTap: () {
              AuthService().logout();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const InitialPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
