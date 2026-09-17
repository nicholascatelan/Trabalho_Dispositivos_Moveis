import 'instrumento.dart';

class InstrumentoEletrico extends Instrumento {
  String tipoCaptador;
  String modelo;

  // Construtor da classe filha.
  InstrumentoEletrico({
    // Repassa os atributos herdados para a classe pai.
    required super.nome,
    required super.marca,
    required super.preco,
    required super.ano,
    required super.categoria,
    required super.descricao,

    // Atributos próprios do instrumento elétrico.
    required this.tipoCaptador,
    required this.modelo,
  });

  // Sobrescreve o método ficha() da classe pai.
  @override
  String ficha() {
    return '${super.ficha()} | Captador: $tipoCaptador | Modelo: $modelo';
  }
}