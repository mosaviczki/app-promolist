import 'package:flutter/material.dart';
import 'package:projeto_dispositivos_moveis/pages/login_page.dart';
import 'package:projeto_dispositivos_moveis/pages/signup_page.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({super.key});

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
        child: ListView(
          children: <Widget>[
            const Text(
              "Bem-vindo",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(13, 17, 23, 1)),
            ),
            const SizedBox(height: 20),
            Container(
              height: size.height * 0.45,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/cart_welcome.png"))),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              width: size.width * 0.7,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  border:
                      Border.all(color: const Color.fromARGB(255, 26, 43, 64)),
                  borderRadius: BorderRadius.circular(30)),
              child: MaterialButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()));
                },
                child: const Text(
                  "LOGIN",
                  style: TextStyle(
                      color: Color.fromARGB(255, 26, 43, 64),
                      fontFamily: 'Poppins',
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
            const SizedBox(height: 40),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              width: size.width * 0.7,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 26, 43, 64),
                  borderRadius: BorderRadius.circular(30)),
              child: MaterialButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignUpPage()));
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