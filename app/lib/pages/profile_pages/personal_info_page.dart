import 'package:flutter/material.dart';
import 'package:projeto_dispositivos_moveis/services/auth_service.dart';
import 'package:provider/provider.dart';

class PersonalInfoPage extends StatefulWidget {
  const PersonalInfoPage({super.key, required this.nome, required this.email});
  final String nome, email;
  @override
  State<PersonalInfoPage> createState() => _PersonalInfoPageState();
}

class _PersonalInfoPageState extends State<PersonalInfoPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController =
        TextEditingController(text: widget.email);

/*     updateEmail() async {
      try {
        await context.read<AuthService>().updateEmail(widget.email, ,emailController.text);
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Email alterada com sucesso'),
            backgroundColor: Colors.green));
      } on AuthException catch (e) {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(e.message), backgroundColor: Colors.red));
      }
    } */

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        forceMaterialTransparency: true,
      ),
      backgroundColor: const Color.fromRGBO(240, 240, 240,1
      
       ),
      body: SingleChildScrollView(
        reverse: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
          child: Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Configurações do perfil',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        fontSize: 28),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Column(
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.person,
                        size: 100,
                      ),
                      Column(
                        children: [
                          Text(widget.nome),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    suffixIcon: InkWell(
                      child: Icon(Icons.edit),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 45,
              ),
              const SizedBox(
                height: 80,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    /* updateEmail(); */
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: const Text('Salvar alterações'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
