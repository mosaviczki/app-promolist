import 'package:flutter/material.dart';
import 'package:projeto_dispositivos_moveis/model/address_model.dart';
import 'package:projeto_dispositivos_moveis/pages/main_page.dart';
import 'package:projeto_dispositivos_moveis/repositories/address_repository.dart';
import 'package:projeto_dispositivos_moveis/repositories/myAddress_repository.dart';
import 'package:provider/provider.dart';

class AddressesCard extends StatefulWidget {
  AddressesCard({Key? key, required this.addresses}) : super(key: key);

  AddressModel addresses;

  @override
  State<AddressesCard> createState() => _AddressesCardState();
}

class _AddressesCardState extends State<AddressesCard> {
  late MyAddressRepository my_address;
  late AddressRepository addressesAll;
  List<AddressModel> selecionada = [];

  @override
  Widget build(BuildContext context) {
    my_address = Provider.of<MyAddressRepository>(context);
    addressesAll = Provider.of<AddressRepository>(context);

    return Card(
      margin: const EdgeInsets.only(top: 10),
      elevation: 2,
      child: InkWell(
        onTap: () {
          setState(() {
            (selecionada.contains(widget.addresses))
                ? selecionada.remove(widget.addresses)
                : selecionada.add(widget.addresses);
          });
          if (my_address.lista.isNotEmpty) {
            my_address.removeAll();
            my_address.saveAll(selecionada);
          } else {
            my_address.saveAll(selecionada);
          }

          print("Endereco, ${my_address.lista.length}");
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => MainPage()));
        },
        child: Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 20, left: 20),
          child: Row(children: [
            const Icon(Icons.location_on_outlined),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      "${widget.addresses.address}, ${widget.addresses.number}"),
                  Text("${widget.addresses.city} - ${widget.addresses.uf}"),
                ],
              ),
            ),
            PopupMenuButton(
              icon: const Icon(Icons.more_vert),
              itemBuilder: (context) => [
                PopupMenuItem(
                  child: ListTile(
                    title: const Text('Remover endereço'),
                    onTap: () {
                      Navigator.pop(context);
                      Provider.of<AddressRepository>(context, listen: false)
                          .remove(widget.addresses);
                    },
                  ),
                )
              ],
            )
          ]),
        ),
      ),
    );
  }
}
