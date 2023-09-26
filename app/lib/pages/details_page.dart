import 'package:flutter/material.dart';
import 'package:projeto_dispositivos_moveis/components/app_bar.dart';


class DetailsPages extends StatefulWidget {
  const DetailsPages({super.key, required this.cardKey});

  final String cardKey;

  @override
  State<DetailsPages> createState() => _DetailsPagesState();
}

class _DetailsPagesState extends State<DetailsPages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarComponent(),
      body: Center(
        child: Container(
          height: 50,
          color: Colors.blue,
          child: Text('Detalhas da compra com id: ${widget.cardKey}'),
        ),
      ),
    );
  }
}
