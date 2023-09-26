import 'package:flutter/material.dart';
import 'package:projeto_dispositivos_moveis/components/app_bar.dart';
import 'package:projeto_dispositivos_moveis/components/input_password.dart';
import 'package:projeto_dispositivos_moveis/components/input_text.dart';
import 'package:projeto_dispositivos_moveis/services/auth_service.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final formKey = GlobalKey<FormState>();
  bool isLogin = false;

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
      await context.read<AuthService>().register(_nomeController.text,
          _emailController.text, _phoneController.text, _senhaController.text);
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Cadastrado com sucesso"), backgroundColor: Colors.green));
    } on AuthException catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message), backgroundColor: Colors.red));
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: const AppBarComponent(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: ListView(
          children: <Widget>[
            const Text(
              "CADASTRO",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(13, 17, 23, 1)),
            ),
            Container(
              height: size.height * 0.32,
              decoration: const BoxDecoration(
                  image:
                      DecorationImage(image: AssetImage("assets/signup.png"))),
            ),
            InputText(
                hintText: 'Nome',
                backgroundColor: Colors.white,
                iconData: Icons.person,
                inputType: TextInputType.name,
                isController: _nomeController,
                inputFormatter: true),
            const SizedBox(height: 10),
            InputText(
              hintText: 'Email',
              backgroundColor: Colors.white,
              iconData: Icons.mail,
              isController: _emailController,
              inputType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 10),
            InputText(
              hintText: 'Telefone',
              backgroundColor: Colors.white,
              iconData: Icons.phone,
              isController: _phoneController,
              inputType: TextInputType.phone,
            ),
            const SizedBox(height: 10),
            InputPassword(
              hintText: 'Password',
              backgroundColor: Colors.white,
              isController: _senhaController,
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              width: size.width * 0.7,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 26, 43, 64),
                  borderRadius: BorderRadius.circular(30)),
              child: MaterialButton(
                onPressed: () {
                  /* if (formKey.currentState!.validate()) {
                    if (!isLogin) {
                      register();
                    } else {
                      return;
                    }
                  } */
                  if (!isLogin) {
                    register();
                  } else {
                    // ignore: avoid_print
                    print("Falha");
                  }
                },
                child: const Text(
                  "CADASTRAR",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Poppins',
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
