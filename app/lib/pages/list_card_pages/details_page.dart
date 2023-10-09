import 'package:flutter/material.dart';
import 'package:projeto_dispositivos_moveis/components/app_bar.dart';
import 'package:projeto_dispositivos_moveis/model/cards_model.dart';
import 'package:projeto_dispositivos_moveis/repositories/card_repository.dart';
import 'package:provider/provider.dart';

class DetailsPages extends StatefulWidget {
  DetailsPages({
    super.key,
    required this.card,
  });

  CardsModel card;
  @override
  State<DetailsPages> createState() => _DetailsPagesState();
}

class _DetailsPagesState extends State<DetailsPages> {
  late CardRepository cardsRepository;

  void incrementValue(CardsModel card, int index) {
    setState(() {
      card.listaItens[index].quantidade++;
    });
  }

  void decrementValue(CardsModel card, int index) {
    setState(() {
      if (card.listaItens[index].quantidade != 1) {
        card.listaItens[index].quantidade--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    cardsRepository = Provider.of<CardRepository>(context);
    return Scaffold(
      appBar: const AppBarComponent(),
      backgroundColor: const Color.fromRGBO(240, 240, 240, 1),
      body: Column(
        children: [
          const SizedBox(
            height: 25,
          ),
           Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(widget.card.titulo),
            ],
          ),
          const SizedBox(
            height: 35,
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
              ),
              itemBuilder: (context, index) => ListTile(
                title: Text(
                  widget.card.listaItens[index].nome,
                  overflow: TextOverflow.ellipsis,
                ),
                leading: const Icon(Icons.shopping_bag_rounded),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {
                        decrementValue(widget.card, index);
                      },
                      icon: const Icon(Icons.remove),
                    ),
                    Text(widget.card.listaItens[index].quantidade.toString()),
                    IconButton(
                      onPressed: () {
                        incrementValue(widget.card, index);
                      },
                      icon: const Icon(Icons.add),
                    ),
                  ],
                ),
              ),
              separatorBuilder: (context, index) => const SizedBox(
                height: 10,
              ),
              itemCount: widget.card.listaItens.length,
            ),
          ),
        ],
      ),
    );
  }
}
