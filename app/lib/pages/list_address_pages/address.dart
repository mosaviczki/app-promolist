import 'package:flutter/material.dart';
import 'package:projeto_dispositivos_moveis/components/input_text.dart';
import 'package:projeto_dispositivos_moveis/model/address_model.dart';
import 'package:projeto_dispositivos_moveis/repositories/address_repository.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AddressPage extends StatefulWidget {
  const AddressPage({super.key});

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  final formKey = GlobalKey<FormState>();
  final _cepController = TextEditingController();
  final _addressController = TextEditingController();
  final _numberController = TextEditingController();
  final _complementController = TextEditingController();
  late TextEditingController _cityController = TextEditingController();
  late TextEditingController _ufController = TextEditingController();
  late AddressRepository addressesAll;

  buscaCep() async {
    String cep = _cepController.text;

    String url = 'https://viacep.com.br/ws/$cep/json/';

    http.Response response;

    response = await http.get(url as Uri);

    Map<String, dynamic> dados = json.decode(response.body);
    setState(() {
      _cityController = dados["localidade"];
      _ufController = dados["uf"];
    });
  }

  saveAddress() {
    setState(() {
      List<AddressModel> listaAddress = [
        AddressModel(
          zipcode: int.parse(_cepController.text),
          address: _addressController.text,
          number: _numberController.text,
          city: _cityController.text,
          uf: _ufController.text,
          complement: _complementController.text,
        ),
      ];
      addressesAll.saveAll(listaAddress);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Endereço cadastrado com sucesso'),
          backgroundColor: Colors.green));
      limparTela();
    });
  }

  limparTela() {
    setState(() {
      _addressController.clear();
      _cepController.clear();
      _cityController.clear();
      _numberController.clear();
      _ufController.clear();
      _complementController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    addressesAll = Provider.of<AddressRepository>(context);
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color.fromARGB(0, 255, 255, 255),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon:
                const Icon(Icons.arrow_back_ios, size: 20, color: Colors.black),
          ),
        ),
        body: SingleChildScrollView(
            reverse: true,
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Form(
                    key: formKey,
                    child: Column(
                      children: <Widget>[
                        const Center(
                          child: Text(
                            "ENDEREÇO",
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 24,
                                fontWeight: FontWeight.w500,
                                color: Color.fromRGBO(13, 17, 23, 1)),
                          ),
                        ),
                        const SizedBox(height: 10),
                        InputText(
                          hintText: 'Endereço',
                          backgroundColor: Colors.white,
                          iconData: Icons.home,
                          inputType: TextInputType.text,
                          isController: _addressController,
                        ),
                        InputText(
                          hintText: 'Numero',
                          backgroundColor: Colors.white,
                          iconData: Icons.home,
                          inputType: TextInputType.text,
                          isController: _numberController,
                        ),
                        InputText(
                          hintText: 'Complemento',
                          backgroundColor: Colors.white,
                          inputType: TextInputType.text,
                          iconData: Icons.more_horiz,
                          isController: _complementController,
                        ),
                        InputText(
                          hintText: 'CEP',
                          backgroundColor: Colors.white,
                          iconData: Icons.location_on_outlined,
                          inputType: TextInputType.text,
                          isController: _cepController,
                        ),
                        InputText(
                          hintText: 'Cidade',
                          backgroundColor: Colors.white,
                          iconData: Icons.location_city,
                          inputType: TextInputType.text,
                          isController: _cityController,
                        ),
                        InputText(
                          hintText: 'Estado',
                          backgroundColor: Colors.white,
                          iconData: Icons.map_outlined,
                          inputType: TextInputType.text,
                          isController: _ufController,
                        ),
                        const SizedBox(height: 10),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 5),
                          width: MediaQuery.of(context).size.width * 0.7,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 26, 43, 64),
                              borderRadius: BorderRadius.circular(5)),
                          child: MaterialButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                saveAddress();
                              }
                            },
                            child: const Text(
                              "SALVAR",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    )))));
  }
}
