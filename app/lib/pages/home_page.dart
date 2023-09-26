import 'package:flutter/material.dart';
import 'package:projeto_dispositivos_moveis/components/input_list_card.dart';
import 'package:projeto_dispositivos_moveis/components/list_card.dart';
import 'package:projeto_dispositivos_moveis/components/maps.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isCardVisible = false;

  toggleCardVisibility() {
    setState(() {
      isCardVisible = !isCardVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(240, 240, 240, 1),
      body: Stack(
        children: [
          AnimatedOpacity(
            opacity: isCardVisible ? 0.4 : 1.0,
            duration: const Duration(milliseconds: 300),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
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
                        onPressed: !isCardVisible
                            ? () => toggleCardVisibility()
                            : null,
                        icon: Image.asset("assets/plus_icon.png"),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                    width: size.width * 1,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            color: const Color.fromRGBO(12, 17, 23, 1)),
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
                      separatorBuilder: (context, index) =>
                          const VerticalDivider(
                        width: 10,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Expanded(child: Maps()),
                ],
              ),
            ),
          ),
          if (isCardVisible) const InputListCard(),
        ],
      ),
    );
  }
}
