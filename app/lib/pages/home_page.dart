import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:projeto_dispositivos_moveis/components/app_bar.dart';
import 'package:projeto_dispositivos_moveis/components/list_card.dart';
import 'package:projeto_dispositivos_moveis/components/maps.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late GoogleMapController mapController;
  double lat = -25.072556;
  double long = -50.152239;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(240, 240, 240, 1),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Lista',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                      fontSize: 24),
                ),
                FloatingActionButton.small(
                  onPressed: () {},
                  child: const Icon(Icons.add),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              width: size.width * 1,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border:
                      Border.all(color: const Color.fromRGBO(12, 17, 23, 1)),
                  borderRadius: BorderRadius.circular(15)),
              child: const TextField(
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                    icon: Icon(
                      Icons.search,
                      color: Color.fromRGBO(59, 81, 108, 1),
                    ),
                    hintText: 'Procurar',
                    border: InputBorder.none),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 50,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) =>
                    ListCard(cardKey: index.toString()),
                itemCount: 10,
                separatorBuilder: (context, index) => const VerticalDivider(
                  width: 10,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
