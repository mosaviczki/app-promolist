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

  void mostrarAviso(BuildContext context, String mensagem) {
    final snackBar = SnackBar(
      content: Center(child: Text(mensagem)),
      duration:
          const Duration(seconds: 4), // Duração da notificação em segundos
        backgroundColor: Colors.red[300],
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

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
                  fontWeight: FontWeight.bold,
                )),
          ),
          Container(
            width: 250,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: ElevatedButton(
              onPressed: () {
                if (cardsRepository.lista.length >= 4) {
                  mostrarAviso(context,
                      'Quantidade máxima de Listas de compras atingida!');
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AddCardPage(),
                    ),
                  );
                }
              },
              child: const Text(
                'Adicionar lista',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                ),
              ),
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
                itemBuilder: (context, index) =>
                    ListCard(card: cardsRepository.lista[index]),
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
