class Instrumento {
  String nome;
  String marca;
  double preco;
  int ano;

  Instrumento({
    required this.nome,
    required this.marca,
    required this.preco,
    required this.ano,
  });

  String ficha() {
    return '$nome | $marca | R\$ ${preco.toStringAsFixed(2)} | $ano';
  }
}