import 'package:flutter/material.dart';
import 'package:projeto_dispositivos_moveis/components/history_card.dart';
import 'package:projeto_dispositivos_moveis/repositories/card_repository.dart';
import 'package:provider/provider.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
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
        body: ListView.separated(
          itemBuilder: (context, index) {
            return index == 0
                ? const Padding(
                    padding: EdgeInsets.only(left: 60),
                    child: Row(
                      children: [
                        Text(
                          'HISTÓRICO',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                            fontSize: 26,
                          ),
                        )
                      ],
                    ),
                  )
                : const HistoryCard();
          },
          separatorBuilder: (context, index) => const SizedBox(
            height: 30,
          ),
          itemCount: cardsRepository.historico.length,
        ));
  }
}
