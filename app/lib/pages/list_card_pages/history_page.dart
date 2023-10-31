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
          forceMaterialTransparency: false,

        ),
        backgroundColor: const Color.fromRGBO(240, 240, 240, 1),
        body: Container(
          padding: const EdgeInsets.only(bottom: 20),
          child: ListView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 25),
                    child: Text(
                      'Histórico',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                  ),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    itemBuilder: (context, index) {
                      return HistoryCard(
                          titulo: cardsRepository.historico[index].titulo);
                    },
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 30,
                    ),
                    itemCount: cardsRepository.historico.length,
                  ),
                ],
              );
            },
            itemCount: 1,
          ),
        ));
  }
}

/*  ListView.separated(
            
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return HistoryCard(
                  titulo: cardsRepository.historico[index].titulo);
            },
            separatorBuilder: (context, index) => const SizedBox(
              height: 30,
            ),
            itemCount: cardsRepository.historico.length,
          ), */

        /*   const Padding(
        padding: EdgeInsets.only(bottom: 45),
        child: Text(
          'Historico',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ), */