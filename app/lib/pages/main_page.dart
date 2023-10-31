import 'package:flutter/material.dart';
import 'package:projeto_dispositivos_moveis/components/maps.dart';
import 'package:projeto_dispositivos_moveis/components/navbar.dart';
import 'package:projeto_dispositivos_moveis/pages/list_address_pages/listAddress.dart';
import 'package:projeto_dispositivos_moveis/repositories/myAddress_repository.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class MainPage extends StatefulWidget {
  MainPage({
    super.key,
    this.address = 'Ponta Grossa',
  });

  String address;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int paginaAtual = 0;
  late PageController pageController;

  setPaginaAtual(pagina) {
    setState(() {
      paginaAtual = pagina;
    });
  }

  @override
  void initState() {
    /*TODO: implement initState*/
    super.initState();
    pageController = PageController(initialPage: paginaAtual);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const NavBar(),
        appBar: AppBar(),
        body: Stack(children: [
          Column(
            children: <Widget>[
              Center(
                child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ListAddressPage()));
                    },
                    child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          children: <Widget>[
                            const Icon(Icons.house_outlined),
                            const SizedBox(width: 10),
                            Consumer<MyAddressRepository>(
                                builder: (context, my_address, child) {
                              return my_address.lista.isEmpty
                                  ? const Text(
                                      "Adicionar endereço",
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20,
                                      ),
                                    )
                                  : Text(
                                      "${my_address.lista.first.address} - ${my_address.lista.first.city}",
                                      style: const TextStyle(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                      ),
                                    );
                            }),
                          ],
                        ))),
              ),
              const Expanded(child: Maps()),
            ],
          )
        ]));
  }
}
