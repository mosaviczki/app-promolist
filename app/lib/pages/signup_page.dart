import 'package:flutter/material.dart';
import 'package:projeto_dispositivos_moveis/components/input_password.dart';
import 'package:projeto_dispositivos_moveis/components/input_text.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        /* brightness: Brightness.light */
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios, size: 20, color: Colors.black),
        ),
      ),
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
              height: size.height * 0.35,
              decoration: const BoxDecoration(
                  image:
                      DecorationImage(image: AssetImage("assets/signup.png"))),
            ),
            const InputText(hintText: 'Nome', backgroundColor: Colors.white, iconData: Icons.person, inputType: TextInputType.name, inputFormatter: true),
            const SizedBox(height: 10),
            const InputText(hintText: 'Email', backgroundColor: Colors.white, iconData: Icons.mail, inputType: TextInputType.emailAddress,),
            const SizedBox(height: 10),
            const InputText(hintText: 'Telefone', backgroundColor: Colors.white, iconData: Icons.phone, inputType: TextInputType.phone,),
            const SizedBox(height: 10),
            const InputPassword(hintText: 'Password', backgroundColor: Colors.white),
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
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
