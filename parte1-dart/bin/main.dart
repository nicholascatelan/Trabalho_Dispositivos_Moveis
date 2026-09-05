import 'modelos/instrumento.dart';

void main() {
  final instrumento = Instrumento(
    nome: 'Violão Acústico',
    marca: 'Yamaha',
    preco: 1299.90,
    ano: 2024,
  );

  print('===== [1] ENTIDADE PRINCIPAL =====');
  print(instrumento.ficha());
}