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
  final email = TextEditingController();
  final senha = TextEditingController();
  bool isLogin = true;

  @override
  void initState() {
    super.initState();
    setFormAction(true);
  }

  setFormAction(bool acao) {
    setState(() {
      isLogin = acao;
      if (isLogin) {}
    });
  }

  register() async {
    try {
      await context.read<AuthService>().register(email.text, senha.text);
    } on AuthException catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message)));
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
            const InputText(
                hintText: 'Nome',
                backgroundColor: Colors.white,
                iconData: Icons.person,
                inputType: TextInputType.name,
                inputFormatter: true),
            const SizedBox(height: 10),
            const InputText(
              hintText: 'Email',
              backgroundColor: Colors.white,
              iconData: Icons.mail,
              inputType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 10),
            const InputText(
              hintText: 'Telefone',
              backgroundColor: Colors.white,
              iconData: Icons.phone,
              inputType: TextInputType.phone,
            ),
            const SizedBox(height: 10),
            const InputPassword(
                hintText: 'Password', backgroundColor: Colors.white),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              width: size.width * 0.7,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 26, 43, 64),
                  borderRadius: BorderRadius.circular(30)),
              child: MaterialButton(
                onPressed: () {},
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
