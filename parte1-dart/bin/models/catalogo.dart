import 'instrumento.dart';

class Catalogo {
  final List<Instrumento> _instrumentos = [];

  void adicionar(Instrumento instrumento) {
    _instrumentos.add(instrumento);
  }

  int get quantidade{
    return _instrumentos.length;
  }

  List<Instrumento> get instrumentos {
    return List.unmodifiable(_instrumentos); // -> imprede que a lista seja alterada diretamente de fora da classe
  }
}