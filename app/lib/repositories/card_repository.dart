import 'package:projeto_dispositivos_moveis/model/cards_model.dart';
import 'package:projeto_dispositivos_moveis/model/itens.dart';

class CardRepository {
  static  final List<CardsModel> cards = [
    CardsModel(
      id: 1,
      titulo: 'Compras do mês',
      listaItens: [
        Itens(
          nome: 'Pão',
          quantidade: 2,
        ),
      ],
    ),
    CardsModel(
      id: 2,
      titulo: 'Comemorar que não cai na malha fina',
      listaItens: [
        Itens(
          nome: 'Pão',
          quantidade: 2,
        ),
        Itens(
          nome: 'Carne',
          quantidade: 5,
        ),
      ],
    ),
    CardsModel(
      id: 3,
      titulo: 'Compras churrasco',
      listaItens: [
        Itens(
          nome: 'Pão',
          quantidade: 2,
        ),
        Itens(
          nome: 'Bolacha',
          quantidade: 5,
        ),
        Itens(
          nome: 'Carne',
          quantidade: 18,
        ),
        Itens(
          nome: 'Sabonete',
          quantidade: 1,
        ),
        Itens(
          nome: 'Batata',
          quantidade: 3,
        ),
      ],
    ),
  ];
}
