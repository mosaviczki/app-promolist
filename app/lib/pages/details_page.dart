import 'package:flutter/material.dart';
import 'package:projeto_dispositivos_moveis/components/app_bar.dart';
import 'package:projeto_dispositivos_moveis/model/itens.dart';

class DetailsPages extends StatefulWidget {
  const DetailsPages({
    super.key,
    required this.titulo,
    required this.listaItem,
  });

  final String titulo;
  final List<Itens> listaItem;
  @override
  State<DetailsPages> createState() => _DetailsPagesState();
}

class _DetailsPagesState extends State<DetailsPages> {
  @override
  Widget build(BuildContext context) {
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
              Text(widget.titulo),
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
                  widget.listaItem[index].nome,
                  overflow: TextOverflow.ellipsis,
                ),
                leading: const Icon(Icons.shopping_bag_rounded),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          widget.listaItem[index].quantidade -= 1;
                        });
                      },
                      icon: const Icon(Icons.remove),
                    ),
                    Text('${widget.listaItem[index].quantidade}'),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          widget.listaItem[index].quantidade += 1;
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
              itemCount: widget.listaItem.length,
            ),
          ),
        ],
      ),
    );
  }
}
