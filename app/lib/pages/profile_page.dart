import 'package:flutter/material.dart';
import 'package:projeto_dispositivos_moveis/services/auth_service.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: <Widget>[
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Deslogar'),
            onTap: () {
              AuthService().logout();
            },
          )
        ],
      ),
    );
  }
}
