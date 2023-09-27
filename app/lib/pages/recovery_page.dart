import 'package:flutter/material.dart';
import 'package:projeto_dispositivos_moveis/components/app_bar.dart';
import 'package:projeto_dispositivos_moveis/components/input_text.dart';

class RecoveryPage extends StatefulWidget {
  const RecoveryPage({super.key});

  @override
  State<RecoveryPage> createState() => _RecoveryPageState();
}

class _RecoveryPageState extends State<RecoveryPage> {
  final TextEditingController _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: const AppBarComponent(),
      body: Column(
        children: <Widget>[
          const Padding(
              padding: EdgeInsets.only(
            top: 20,
          )),
          const Text(
            "RECUPERAR SENHA",
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 30,
              fontWeight: FontWeight.w500,
              color: Color.fromRGBO(13, 17, 23, 1),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: size.height * 0.35,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/reset_password.png"),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: size.width * 0.75,
            child: const Text(
              "Insira o email associado a sua conta para a próxima etapa",
              style: TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 0.5),
                  fontWeight: FontWeight.w700),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          InputText(
            hintText: 'Email',
            backgroundColor: Colors.white,
            iconData: Icons.email,
            inputType: TextInputType.emailAddress,
            isController: _emailController,
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
            width: size.width * 0.7,
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 26, 43, 64),
                borderRadius: BorderRadius.circular(10)),
            child: MaterialButton(
              onPressed: () {},
              child: const Text(
                "ENVIAR",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
