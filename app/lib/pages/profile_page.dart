import 'package:flutter/material.dart';
import 'package:projeto_dispositivos_moveis/conections/users.dart';
import 'package:projeto_dispositivos_moveis/pages/initial_page.dart';
import 'package:projeto_dispositivos_moveis/pages/privacy_page.dart';
import 'package:projeto_dispositivos_moveis/pages/terms_page.dart';
import 'package:projeto_dispositivos_moveis/services/auth_service.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    String nome = '';

    carregarDados() {}
    return Scaffold(
      backgroundColor: const Color.fromRGBO(240, 240, 240, 1),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 60,
          left: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'PERFIL',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ListTile(
              leading: const Icon(
                Icons.person,
                size: 80,
                color: Colors.black,
              ),
              title: const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 20, bottom: 5),
                    child: Text('Guilherme Sanches'),
                  ),
                ],
              ),
              subtitle: Material(
                color: const Color.fromRGBO(240, 240, 240, 1),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () => print('tap no subtitle'),
                      child: const Text(
                        'Ver perfil',
                        style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 0.5),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
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
              contentPadding: EdgeInsets.only(top: 5, right: 15),
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
      ),
    );
  }
}
