class ItemModel {
  String nome;
  int quantidade;

  ItemModel({
    required this.nome,
    required this.quantidade,
  });

  Map<String, dynamic> toMap() {
    return {
      'nome': nome,
      'quantidade': quantidade,
    };
  }
}
