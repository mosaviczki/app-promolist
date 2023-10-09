import 'package:projeto_dispositivos_moveis/model/item_model.dart';

class CardsModel {
  int id;
  String titulo;
  List<ItemModel> listaItens;

  CardsModel({
    required this.id,
    required this.titulo,
    required this.listaItens,
  });
}
