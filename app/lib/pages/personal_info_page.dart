import 'package:flutter/material.dart';

class PersonalInfoPage extends StatefulWidget {
  const PersonalInfoPage(
      {super.key,
      required this.nome,
      required this.email,
      required this.telefone});
  final String nome, email, telefone;
  @override
  State<PersonalInfoPage> createState() => _PersonalInfoPageState();
}

class _PersonalInfoPageState extends State<PersonalInfoPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController nameController =
        TextEditingController(text: widget.nome);
    
    TextEditingController lastNameController =
        TextEditingController(text: '');
    
    TextEditingController emailController =
        TextEditingController(text: widget.email);
    TextEditingController phoneController =
        TextEditingController(text: widget.telefone);

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        forceMaterialTransparency: true,
      ),
      backgroundColor: const Color.fromRGBO(240, 240, 240, 1),
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
                          SizedBox(
                            width: 230,
                            child: TextFormField(
                              controller: nameController,
                              decoration: const InputDecoration(
                                labelText: 'Nome',
                                isDense: true,
                              ),
                              onEditingComplete: () {
                                setState(() {});
                              },
                            ),
                          ),
                          SizedBox(
                            width: 230,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                bottom: 20,
                              ),
                              child: TextFormField(
                                controller: lastNameController,
                                decoration: const InputDecoration(
                                  labelText: 'Sobrenome',
                                  isDense: true,
                                ),
                              ),
                            ),
                          ),
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: TextFormField(
                  controller: phoneController,
                  decoration: const InputDecoration(
                    labelText: 'Telefone',
                    suffixIcon: InkWell(
                      child: Icon(Icons.edit),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 80,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    print(nameController.text);
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
