// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:projeto_dispositivos_moveis/components/app_bar.dart';
import 'package:projeto_dispositivos_moveis/components/input_password.dart';
import 'package:projeto_dispositivos_moveis/components/input_text.dart';
import 'package:projeto_dispositivos_moveis/pages/login_page.dart';
import 'package:projeto_dispositivos_moveis/services/auth_service.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();

  @override
  void initState() {
    super.initState();
    /* setFormAction(true); */
  }

  register() async {
    try {
      await context
          .read<AuthService>()
          .register(_emailController.text, _senhaController.text, _nomeController.text);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Cadastrado com sucesso'),
          backgroundColor: Colors.green));
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const LoginPage()));
    } on AuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.message), backgroundColor: Colors.red));
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: const AppBarComponent(),
      body: SingleChildScrollView(
        reverse: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                const Center(
                  child: Text(
                    "CADASTRO",
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(13, 17, 23, 1)),
                  ),
                ),
                Container(
                  height: size.height * 0.30,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/signup.png"))),
                ),
                InputText(
                  hintText: 'Nome',
                  backgroundColor: Colors.white,
                  iconData: Icons.person,
                  inputType: TextInputType.name,
                  isController: _nomeController,
                ),
                InputText(
                  hintText: 'Email',
                  backgroundColor: Colors.white,
                  iconData: Icons.email,
                  inputType: TextInputType.emailAddress,
                  isController: _emailController,
                ),
                InputText(
                  hintText: 'Telefone',
                  backgroundColor: Colors.white,
                  iconData: Icons.phone,
                  inputType: TextInputType.phone,
                  isController: _phoneController,
                ),
                InputPassword(
                  hintText: 'Password',
                  backgroundColor: Colors.white,
                  isController: _senhaController,
                ),
                const SizedBox(height: 10),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  width: size.width * 0.7,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 26, 43, 64),
                      borderRadius: BorderRadius.circular(10)),
                  child: MaterialButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        register();
                      }
                    },
                    child: const Text(
                      "CADASTRAR",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 5),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
