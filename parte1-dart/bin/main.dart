import 'models/instrumento.dart';
import 'models/instrumento_eletrico.dart';


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

  // Cria um objeto da classe filha.
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
}