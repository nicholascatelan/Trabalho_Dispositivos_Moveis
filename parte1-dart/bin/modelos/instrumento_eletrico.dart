import 'instrumento.dart';

class InstrumentoEletrico extends Instrumento {
  String tipoCaptador;
  double potencia;

  // Construtor da classe filha
  InstrumentoEletrico({
    // super repassa os atributos herdados para a classe pai.
    required super.nome,
    required super.marca,
    required super.preco,
    required super.ano,

    required this.tipoCaptador,
    required this.potencia,
  });

  // Sobrescreve o método ficha() que existe na classe pai
  @override
  String ficha() {
    return '${super.ficha()} | Captador: $tipoCaptador | Potência: ${potencia}W';
  }
}
