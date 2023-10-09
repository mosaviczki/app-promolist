import 'package:flutter/material.dart';
import 'package:projeto_dispositivos_moveis/components/app_bar.dart';

class DetailsPages extends StatefulWidget {
  const DetailsPages({
    super.key,
  });

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
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('titulo'),
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
                title: const Text(
                  'teste',
                  overflow: TextOverflow.ellipsis,
                ),
                leading: const Icon(Icons.shopping_bag_rounded),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.remove),
                    ),
                    const Text('quantidade'),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.add),
                    ),
                  ],
                ),
              ),
              separatorBuilder: (context, index) => const SizedBox(
                height: 10,
              ),
              itemCount: 5,
            ),
          ),
        ],
      ),
    );
  }
}
