import 'instrumento.dart';

class InstrumentoEletrico extends Instrumento {
  String tipoCaptador;
  String modelo;

 
  InstrumentoEletrico({

    required super.nome,
    required super.marca,
    required super.preco,
    required super.ano,

    required this.tipoCaptador,
    required this.modelo,
  });


  @override
  String ficha() {
    return '${super.ficha()} | Captador: $tipoCaptador | Modelo: ${modelo}W';
  }
}
