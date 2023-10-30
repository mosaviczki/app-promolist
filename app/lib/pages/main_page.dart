import 'package:flutter/material.dart';
import 'package:projeto_dispositivos_moveis/components/maps.dart';
import 'package:projeto_dispositivos_moveis/components/navbar.dart';
import 'package:projeto_dispositivos_moveis/pages/listAddress.dart';
import 'package:projeto_dispositivos_moveis/pages/list_card_pages/list_card_page.dart';

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
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ListCardPage(),
          ),
        ),
        child: const Icon(Icons.add),
      ),
      body: Stack(
        children: [
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
                            Text(
                              widget.address,
                              style: const TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ))),
              ),
              const Expanded(child: Maps()),
            ],
          )
        ],
      ),
    );
  }
}
