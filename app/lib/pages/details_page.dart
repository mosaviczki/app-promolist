import 'package:flutter/material.dart';
import 'package:projeto_dispositivos_moveis/components/app_bar.dart';
import 'package:projeto_dispositivos_moveis/components/list_card.dart';

class DetailsPages extends StatefulWidget {
  const DetailsPages({super.key, required this.cardKey});

  final String cardKey;

  @override
  State<DetailsPages> createState() => _DetailsPagesState();
}

class _DetailsPagesState extends State<DetailsPages> {
  int valorTeste = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarComponent(),
      backgroundColor: Colors.grey[200],
      body: Column(
        children: [
          const SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Detalhes da compra com id: ${widget.cardKey}'),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Preço: 800,00'),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
              ),
              itemBuilder: (context, index) => ListTile(
                title: const Text('Item para compra',
                    overflow: TextOverflow.ellipsis),
                leading: const Icon(Icons.shopping_bag_rounded),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          if (valorTeste != 0) {
                            valorTeste -= 1;
                          }
                        });
                      },
                      icon: const Icon(Icons.remove),   
                    ),
                    Text('$valorTeste'),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          valorTeste += 1;
                        });
                      },
                      icon: const Icon(Icons.add),
                    ),
                  ],
                ),
              ),
              separatorBuilder: (context, index) => const SizedBox(
                height: 10,
              ),
              itemCount: 13,
            ),
          ),
        ],
      ),
    );
  }
}
