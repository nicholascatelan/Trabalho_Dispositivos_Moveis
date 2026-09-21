import 'models/instrumento.dart';
import 'models/instrumento_eletrico.dart';
import 'models/catalogo.dart';

void main() {
  // ==================================================
  //         EXERCÍCIO 1 — ENTIDADE PRINCIPAL
  // ==================================================

  final instrumento = Instrumento(
    nome: 'Violão Acústico',
    marca: 'Yamaha',
    preco: 1299.90,
    ano: 2024,
  );

  print('===== [1] ENTIDADE PRINCIPAL =====');
  print(instrumento.ficha());

  // ==================================================
  //         EXERCÍCIO 2 - HERANÇA
  // ==================================================


  final instrumentoEletrico = InstrumentoEletrico(
    nome: 'Guitarra Elétrica',
    marca: 'Gibson',
    preco: 8000.00,
    ano: 1957,
    tipoCaptador: 'Humbucker',
    modelo: 'Les Paul',
  );

  print('\n===== [2] HERANÇA =====');

  print(instrumento.ficha());

  print(instrumentoEletrico.ficha());

  // ==================================================
  //         EXERCÍCIO 3 - COMPOSIÇÃO
  // ==================================================


  final catalogo = Catalogo();

  catalogo.adicionar(instrumento);

  catalogo.adicionar(
    Instrumento(
      nome: 'Baixo',
      marca: 'Fender',
      preco: 12000,
      ano: 1967
    )
  );
  catalogo.adicionar(
    Instrumento(
      nome: 'Teclado',
      marca: 'Yamaha',
      preco: 15000,
      ano: 2025
    )
  );
  catalogo.adicionar(
    Instrumento(
      nome: 'Bateria',
      marca: 'Pearl',
      preco: 5000,
      ano: 2016
    )
  );

print('\n===== [3] COMPOSIÇÃO =====');

// Mostra quantos instrumentos existem no catálogo.
print('Quantidade de instrumentos: ${catalogo.quantidade}');

for (final item in catalogo.instrumentos) {
  print(item.ficha());
}

  // ==================================================
  //         EXERCÍCIO 4 - EMCAPSULAMENTO
  // ==================================================

print('\n===== [4] ENCAPSULAMENTO =====');

print(
  'Valor total antes: R\$ ${catalogo.valorTotal.toStringAsFixed(2)}',
);

catalogo.adicionar(
  Instrumento(
    nome: 'Teclado Musical',
    marca: 'Casio',
    preco: 1500.00,
    ano: 2025,
  ),
);

print(
  'Valor total depois: R\$ ${catalogo.valorTotal.toStringAsFixed(2)}',
);

}
