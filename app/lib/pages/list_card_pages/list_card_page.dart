import 'package:flutter/material.dart';
import 'package:projeto_dispositivos_moveis/pages/list_card_pages/add_card_page.dart';
import 'package:projeto_dispositivos_moveis/pages/list_card_pages/list_card.dart';
import 'package:projeto_dispositivos_moveis/repositories/card_repository.dart';
import 'package:provider/provider.dart';

class ListCardPage extends StatefulWidget {
  const ListCardPage({super.key});

  @override
  State<ListCardPage> createState() => _ListCardPageState();
}

class _ListCardPageState extends State<ListCardPage> {
  late CardRepository cardsRepository;

  @override
  Widget build(BuildContext context) {
    cardsRepository = Provider.of<CardRepository>(context);

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        forceMaterialTransparency: true,
      ),
      backgroundColor: const Color.fromRGBO(240, 240, 240, 1),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(18.0),
            child: Text('Listas de compra',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 28,
                )),
          ),
          SizedBox(
            width: 250,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddCardPage(),
                  ),
                );
              },
              child: const Text('Nova lista'),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) =>  ListCard(title: cardsRepository.lista[index].titulo),
                separatorBuilder: (context, index) => const SizedBox(
                  height: 20,
                ),
                itemCount: cardsRepository.lista.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
