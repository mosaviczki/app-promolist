import 'package:flutter/material.dart';
import 'package:projeto_dispositivos_moveis/model/address_model.dart';
import 'package:projeto_dispositivos_moveis/pages/address.dart';
import 'package:projeto_dispositivos_moveis/pages/main_page.dart';
import 'package:projeto_dispositivos_moveis/repositories/address_repository.dart';

class ListAddressPage extends StatefulWidget {
  const ListAddressPage({super.key});

  @override
  State<ListAddressPage> createState() => _ListAddressPageState();
}

class _ListAddressPageState extends State<ListAddressPage> {
  final lista = AddressRepository.lista;
  List<AddressModel> selecionada = [];
  String endereco = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromARGB(0, 255, 255, 255),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios, size: 20, color: Colors.black),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(children: [
            Container(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AddressPage()));
                  },
                  child: const Text('Adicionar endereço'),
                )),
            Container(
                alignment: Alignment.centerRight,
                child: SizedBox(
                    height: 500,
                    child: ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            leading: const Icon(Icons.location_on_outlined),
                            title: Text(
                                "${lista[index].address}, ${lista[index].number}"),
                            trailing: Text(lista[index].uf),
                            selected: selecionada.contains(lista[index]),
                            selectedTileColor:
                                const Color.fromARGB(255, 231, 231, 231),
                            onLongPress: () {
                              setState(() {
                                (selecionada.contains(lista[index]))
                                    ? selecionada.remove(lista[index])
                                    : selecionada.add(lista[index]);
                              });
                            },
                            onTap: () {
                              endereco =
                                  '${lista[index].address}, ${lista[index].city}';
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) =>
                                          MainPage(address: endereco)));
                            },
                          );
                        },
                        padding: const EdgeInsets.all(15),
                        separatorBuilder: (_, __) => const Divider(),
                        itemCount: lista.length))),
          ])),
    );
  }
}
