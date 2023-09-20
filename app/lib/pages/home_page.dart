import 'package:flutter/material.dart';
import 'package:projeto_dispositivos_moveis/components/app_bar.dart';
import 'package:projeto_dispositivos_moveis/components/list_card.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBarComponent(),
      backgroundColor: const Color.fromRGBO(240, 240, 240, 1),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
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
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.exposure_plus_1_outlined)),
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
