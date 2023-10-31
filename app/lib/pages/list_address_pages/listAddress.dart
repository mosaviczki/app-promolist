import 'package:flutter/material.dart';
import 'package:projeto_dispositivos_moveis/pages/list_address_pages/address.dart';
import 'package:projeto_dispositivos_moveis/pages/list_address_pages/addressesCard.dart';
import 'package:projeto_dispositivos_moveis/repositories/address_repository.dart';
import 'package:provider/provider.dart';

class ListAddressPage extends StatefulWidget {
  const ListAddressPage({super.key});

  @override
  State<ListAddressPage> createState() => _ListAddressPageState();
}

class _ListAddressPageState extends State<ListAddressPage> {
  late AddressRepository addresses;

  @override
  Widget build(BuildContext context) {
    addresses = Provider.of<AddressRepository>(context);
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
                    child: Consumer<AddressRepository>(
                        builder: (context, addresses, child) {
                      return addresses.lista.isEmpty
                          ? ListView()
                          : ListView.builder(
                              itemCount: addresses.lista.length,
                              itemBuilder: (_, index) {
                                return AddressesCard(
                                    addresses: addresses.lista[index]);
                              });
                    }))),
          ])),
    );
  }
}
