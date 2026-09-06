import 'instrumento.dart';


class InstrumentoEletrico extends Instrumento {

  String tipoCaptador;
  double potencia;


  InstrumentoEletrico({
  
    required super.nome,
    required super.marca,
    required super.preco,
    required super.ano,

  
    required this.tipoCaptador,
    required this.potencia,
  });


  @override
  String ficha() {

    return '${super.ficha()} | Captador: $tipoCaptador | Potência: ${potencia}W';
  }
}