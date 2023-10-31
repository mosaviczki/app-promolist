import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projeto_dispositivos_moveis/components/input_password.dart';
import 'package:projeto_dispositivos_moveis/services/auth_service.dart';
import 'package:provider/provider.dart';

class NewPasswordPage extends StatefulWidget {
  const NewPasswordPage({super.key});

  @override
  State<NewPasswordPage> createState() => _NewPasswordPageState();
}

class _NewPasswordPageState extends State<NewPasswordPage> {
  final formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  User? usuario = FirebaseAuth.instance.currentUser;
  String email = '';

  update() async {
    setState(() {
      email = usuario!.email!;
    });
    try {
      await context.read<AuthService>().updatePassword(
          email, _passwordController.text, _newPasswordController.text);
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Senha alterada com sucesso'),
          backgroundColor: Colors.green));
    } on AuthException catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.message), backgroundColor: Colors.red));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color.fromARGB(0, 255, 255, 255),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon:
                const Icon(Icons.arrow_back_ios, size: 20, color: Colors.black),
          ),
        ),
        body: Center(
          child: Form(
            key: formKey,
            child: Column(children: [
              InputPassword(
                hintText: 'Senha atual',
                backgroundColor: Colors.white,
                isController: _passwordController,
              ),
              InputPassword(
                hintText: 'Nova senha',
                backgroundColor: Colors.white,
                isController: _newPasswordController,
              ),
              const SizedBox(height: 10),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                width: MediaQuery.of(context).size.width * 0.7,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 26, 43, 64),
                    borderRadius: BorderRadius.circular(10)),
                child: MaterialButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      update();
                    }
                  },
                  child: const Text(
                    "ALTERAR",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ]),
          ),
        ));
  }
}
