class Instrumento {
  String nome;
  String marca;
  double preco;
  int ano;
  String categoria;
  String descricao;

  Instrumento({
    required this.nome,
    required this.marca,
    required this.preco,
    required this.ano,
    required this.categoria,
    required this.descricao,
  });

  // Retorna as principais informações do instrumento.
  String ficha() {
    return '$nome | $marca | R\$ ${preco.toStringAsFixed(2)} | $ano';
  }
}