import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:projeto_dispositivos_moveis/components/maps.dart';
import 'package:projeto_dispositivos_moveis/pages/history_page.dart';
import 'package:projeto_dispositivos_moveis/pages/home_page.dart';
import 'package:projeto_dispositivos_moveis/pages/profile_page.dart';

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
      body: PageView(
        controller: pageController,
        onPageChanged: setPaginaAtual,
        children: const [
          HomePage(),
          Maps(),
          HistoryPage(),
          ProfilePage(),
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GNav(
            backgroundColor: Colors.white,
            color: Colors.black,
            activeColor: Colors.black,
            tabBackgroundColor: Colors.grey,
            duration: const Duration(milliseconds: 500),
            gap: 8,
            onTabChange: (index) {
              pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 400),
                curve: Curves.ease,
              );
            },
            tabs: const [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.location_on,
                text: 'Mapa',
              ),
              GButton(
                icon: Icons.history,
                text: 'Histórico',
              ),
              GButton(
                icon: Icons.person,
                text: 'Perfil',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
