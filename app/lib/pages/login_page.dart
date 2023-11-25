import 'package:flutter/material.dart';
import 'package:projeto_dispositivos_moveis/components/app_bar.dart';
import 'package:projeto_dispositivos_moveis/components/input_password.dart';
import 'package:projeto_dispositivos_moveis/components/input_text.dart';
import 'package:projeto_dispositivos_moveis/pages/main_page.dart';
import 'package:projeto_dispositivos_moveis/pages/recovery_page.dart';
import 'package:projeto_dispositivos_moveis/services/auth_service.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();

  bool isLogin = true;
  bool _obscureText = true;
  bool loading = false;

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

  login() async {
    setState(() => loading = true);
    try {
      await context
          .read<AuthService>()
          .login(_emailController.text, _senhaController.text);
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Logado com sucesso'), backgroundColor: Colors.green));
      // ignore: use_build_context_synchronously
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MainPage()));
    } on AuthException catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.message), backgroundColor: Colors.red));
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const AppBarComponent(),
      body: SingleChildScrollView(
        reverse: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                const Center(
                  child: Text(
                    "LOGIN",
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
                          image: AssetImage("assets/login.png"))),
                ),
                InputText(
                  hintText: 'Email',
                  backgroundColor: Colors.white,
                  iconData: Icons.email,
                  inputType: TextInputType.emailAddress,
                  isController: _emailController,
                ),
                const SizedBox(height: 20),
                InputPassword(
                  hintText: 'Password',
                  backgroundColor: Colors.white,
                  isController: _senhaController,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 160,
                  ),
                  child: TextButton(
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.blue),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RecoveryPage()));
                    },
                    child: const Text(
                      'ESQUECEU A SENHA?',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Color.fromRGBO(13, 17, 23, 1.0),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20),
                  width: size.width * 0.7,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 26, 43, 64),
                      borderRadius: BorderRadius.circular(10)),
                  child: MaterialButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        if (isLogin) {
                          login();
                        }
                      }
                    },
                    child: const Text(
                      "ENTRAR",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget togglePassword() {
    return IconButton(
      onPressed: () {
        setState(() {
          _obscureText = !_obscureText;
        });
      },
      icon: _obscureText
          ? const Icon(Icons.visibility)
          : const Icon(Icons.visibility_off),
      color: const Color.fromRGBO(82, 115, 156, 1),
    );
  }
}
