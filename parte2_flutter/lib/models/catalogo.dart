import 'instrumento.dart';

class Catalogo {
  final List<Instrumento> _instrumentos = [];

  void adicionar(Instrumento instrumento) {
    _instrumentos.add(instrumento);
  }

  // Exclui um instrumento do catálogo
  void excluir(Instrumento instrumento) {
    _instrumentos.remove(instrumento);
  }

  int get quantidade {
    return _instrumentos.length;
  }

  List<Instrumento> get instrumentos {
    return List.unmodifiable(_instrumentos);
  }

  double get valorTotal {
    return _instrumentos.fold(
      0,
      (total, instrumento) => total + instrumento.preco,
    );
  }
}