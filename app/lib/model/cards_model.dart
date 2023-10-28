import 'package:projeto_dispositivos_moveis/model/item_model.dart';

class CardsModel {
  String titulo;
  List<ItemModel> listaItens;

  CardsModel({
    required this.titulo,
    required this.listaItens,
  });

  Map<String, dynamic> toMap() {
    List<Map<String, dynamic>> itens =
        listaItens.map((item) => item.toMap()).toList();
    return {
      'titulo': titulo,
      'listaItens': itens,
    };
  }
}
