import 'package:flutter/material.dart';
import 'package:projeto_dispositivos_moveis/components/maps.dart';
import 'package:projeto_dispositivos_moveis/components/navbar.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

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
          onPressed: () => print('tap'),
          child: const Icon(Icons.add),
        ),
        body: const Stack(children: [
          Column(
            children: <Widget>[
              Center(
                  child: Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.house_outlined),
                          SizedBox(width: 10),
                          Text(
                            "R. Dep. Chafic Cury, Ponta Grossa",
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ))),
              Expanded(child: Maps()),
            ],
          )
        ]));
  }
}
