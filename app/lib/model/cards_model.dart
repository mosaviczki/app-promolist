import 'package:projeto_dispositivos_moveis/model/itens.dart';

class CardsModel {
  int id;
  String titulo;
  List<Itens> listaItens;

  CardsModel({
    required this.id,
    required this.titulo,
    required this.listaItens,
  });
}
