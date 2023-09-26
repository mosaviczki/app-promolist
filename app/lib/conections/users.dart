void main() {
  List<User> users = [
    User(nome: 'Weiry', telefone: '(42)997865050', email: 'weiry@email.com'),
    User(
        nome: 'Guilherme',
        telefone: '(42)999887766',
        email: 'guilherme@email.com'),
    User(
        nome: 'Monique', telefone: '(42)997193344', email: 'monique@email.com'),
  ];
}

class User {
  String nome;
  String telefone;
  String email;

  User({required this.nome, required this.telefone, required this.email});
}
