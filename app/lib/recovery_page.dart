import 'package:flutter/material.dart';

class RecoveryPage extends StatefulWidget {
  const RecoveryPage({super.key});

  @override
  State<RecoveryPage> createState() => _RecoveryPageState();
}

class _RecoveryPageState extends State<RecoveryPage> {
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
        /* actions: [
          SizedBox(
            child: IconButton(
              iconSize: 100,
              onPressed: () {},
              icon: Image.asset(
                'assets/logo/icon_logo_dark.png',
              ),
            ),
          ),
        ], */
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
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
                Container(
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
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                  width: size.width * 0.78,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                          color: const Color.fromRGBO(12, 17, 23, 1)),
                      borderRadius: BorderRadius.circular(30)),
                  child: const TextField(
                    decoration: InputDecoration(
                        icon: Icon(
                          Icons.email_outlined,
                          color: Color.fromRGBO(59, 81, 108, 1),
                        ),
                        hintText: "Email",
                        border: InputBorder.none),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                  width: size.width * 0.78,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 26, 43, 64),
                      borderRadius: BorderRadius.circular(30)),
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
          ],
        ),
      ),
    );
  }
}
