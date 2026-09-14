import 'package:flutter/material.dart';
import '../models/instrumento.dart';

class InstrumentoDetalhes extends StatelessWidget {
  final Instrumento instrumento;

  const InstrumentoDetalhes({
    super.key,
    required this.instrumento,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Detalhes do Instrumento',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              instrumento.nome,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            Text(
              'Marca: ${instrumento.marca}',
              style: const TextStyle(fontSize: 18),
            ),

            const SizedBox(height: 10),

            Text(
              'Ano: ${instrumento.ano}',
              style: const TextStyle(fontSize: 18),
            ),

            const SizedBox(height: 10),

            Text(
              'Preço: R\$ ${instrumento.preco.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 18),
            ),

            const SizedBox(height: 30),

            const Text(
              'Informações do instrumento',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              'Este instrumento faz parte do catálogo da loja.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}