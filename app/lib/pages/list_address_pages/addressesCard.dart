import 'package:flutter/material.dart';
import 'package:projeto_dispositivos_moveis/model/address_model.dart';
import 'package:projeto_dispositivos_moveis/repositories/address_repository.dart';
import 'package:projeto_dispositivos_moveis/repositories/myAddress_repository.dart';
import 'package:provider/provider.dart';

class AddressesCard extends StatefulWidget {
  const AddressesCard({Key? key, required this.addresses}) : super(key: key);

  final AddressModel addresses;

  @override
  State<AddressesCard> createState() => _AddressesCardState();
}

class _AddressesCardState extends State<AddressesCard> {
  late MyAddressRepository myAddress;
  late AddressRepository addressesAll;
  late AddressModel selecionada;

  @override
  Widget build(BuildContext context) {
    myAddress = Provider.of<MyAddressRepository>(context);
    addressesAll = Provider.of<AddressRepository>(context);

    return Card(
      margin: const EdgeInsets.only(top: 10),
      elevation: 2,
      child: InkWell(
        onTap: () {
          setState(() {
            selecionada = widget.addresses;
          });
          if (myAddress.lista.isNotEmpty) {
            myAddress.update(selecionada);
            print('DEU UPDATE');
          } else {
            myAddress.saveAll(selecionada);
            print('SALVOU PRIMEIRA VEZ ENDERECO');
          }
          Navigator.pop(context);
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
                          .remove(widget.addresses, myAddress.lista, context);
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
