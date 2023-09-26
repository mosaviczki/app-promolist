import 'package:flutter/material.dart';
import 'package:projeto_dispositivos_moveis/components/app_bar.dart';
import 'package:projeto_dispositivos_moveis/components/input_password.dart';
import 'package:projeto_dispositivos_moveis/components/input_text.dart';
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
    } on AuthException catch (e) {
      print(e);
      setState(() => loading = true);
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
      body: SingleChildScrollView(
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
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  width: size.width * 0.7,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 26, 43, 64),
                      borderRadius: BorderRadius.circular(30)),
                  child: MaterialButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        if (isLogin) {
                          login();
                        } else {
                          return;
                        }
                      }
                      /*Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MainPage()));*/
                    },
                    child: const Text(
                      "ENTRAR",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              colors: <Color>[
                                Color.fromRGBO(255, 255, 255, 0.102),
                                Color.fromARGB(255, 43, 32, 72),
                              ],
                              begin: FractionalOffset(0.0, 0.0),
                              end: FractionalOffset(1.0, 1.0),
                              stops: <double>[0.0, 1.0],
                              tileMode: TileMode.clamp),
                        ),
                        width: 100.0,
                        height: 1.0,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 15.0, right: 15.0),
                        child: Text(
                          'Ou entre com',
                          style: TextStyle(
                              color: Color.fromRGBO(13, 17, 23, 1),
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'WorkSansMedium'),
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              colors: <Color>[
                                Color.fromARGB(255, 43, 32, 72),
                                Color.fromRGBO(255, 255, 255, 0.102),
                              ],
                              begin: FractionalOffset(0.0, 0.0),
                              end: FractionalOffset(1.0, 1.0),
                              stops: <double>[0.0, 1.0],
                              tileMode: TileMode.clamp),
                        ),
                        width: 100.0,
                        height: 1.0,
                      ),
                    ],
                  ),
                ),
                /* Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: ElevatedButton.icon(
                        icon: const Icon(
                          Icons.facebook,
                          color: Color.fromRGBO(53, 120, 229, 1),
                        ),
                        label: const Text(
                          "FACEBOOK",
                          style: TextStyle(
                            color: Color.fromRGBO(12, 17, 23, 1),
                          ),
                        ),
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                  color: Color.fromRGBO(13, 17, 23, 1)),
                              borderRadius: BorderRadius.circular(50)),
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: ElevatedButton.icon(
                          icon: Image.network(
                            "https://img.icons8.com/fluency/48/google-logo.png",
                            width: 20,
                          ),
                          label: const Text(
                            "GOOGLE",
                            style: TextStyle(
                              color: Color.fromRGBO(12, 17, 23, 1),
                            ),
                          ),
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                    color: Color.fromRGBO(13, 17, 23, 1)),
                                borderRadius: BorderRadius.circular(50)),
                          ),
                        )),
                  ],
                ), */
                const SizedBox(height: 30)
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
