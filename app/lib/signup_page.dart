import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _obscureText = true;

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
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    const Text(
                      "CADASTRO",
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(13, 17, 23, 1)),
                    ),
                    Container(
                      height: size.height * 0.35,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/signup.png"))),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      width: size.width * 0.7,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                              color: const Color.fromRGBO(12, 17, 23, 1)),
                          borderRadius: BorderRadius.circular(30)),
                      child: const TextField(
                        decoration: InputDecoration(
                            icon: Icon(
                              Icons.person,
                              color: Color.fromRGBO(59, 81, 108, 1),
                            ),
                            hintText: "Nome",
                            border: InputBorder.none),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      width: size.width * 0.7,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                              color: const Color.fromRGBO(12, 17, 23, 1)),
                          borderRadius: BorderRadius.circular(30)),
                      child: const TextField(
                        decoration: InputDecoration(
                            icon: Icon(
                              Icons.mail,
                              color: Color.fromRGBO(59, 81, 108, 1),
                            ),
                            hintText: "Email",
                            border: InputBorder.none),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      width: size.width * 0.7,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                              color: const Color.fromRGBO(12, 17, 23, 1)),
                          borderRadius: BorderRadius.circular(30)),
                      child: const TextField(
                        decoration: InputDecoration(
                            icon: Icon(
                              Icons.phone,
                              color: Color.fromRGBO(59, 81, 108, 1),
                            ),
                            hintText: "Telefone",
                            border: InputBorder.none),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      width: size.width * 0.7,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                              color: const Color.fromRGBO(12, 17, 23, 1)),
                          borderRadius: BorderRadius.circular(30)),
                      child: TextField(
                        obscureText: _obscureText,
                        decoration: InputDecoration(
                            icon: const Icon(
                              Icons.lock,
                              color: Color.fromRGBO(59, 81, 108, 1),
                            ),
                            suffixIcon: togglePassword(),
                            hintText: "Password",
                            border: InputBorder.none),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
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
              ],
            ))
          ],
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
