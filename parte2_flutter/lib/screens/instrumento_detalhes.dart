import 'package:flutter/material.dart';
import '../models/instrumento.dart';

class InstrumentoDetalhes extends StatelessWidget {
  final Instrumento instrumento;

  const InstrumentoDetalhes({
    super.key,
    required this.instrumento,
  });

  IconData escolherIcone() {
    final nome = instrumento.nome.toLowerCase();

    if (nome.contains('teclado') || nome.contains('piano')) {
      return Icons.piano;
    }

    if (nome.contains('bateria')) {
      return Icons.album;
    }

    return Icons.music_note;
  }

  Widget informacao(String titulo, String valor) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: const Color(0xFFF5F5F5),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              titulo,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              valor,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        title: const Text('Detalhes'),
        backgroundColor: const Color(0xFF171717),
        foregroundColor: Colors.white,
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            // Área principal
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(35),
              color: const Color(0xFF171717),

              child: Column(
                children: [
                  Container(
                    width: 110,
                    height: 110,
                    decoration: BoxDecoration(
                      color: Colors.white10,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Icon(
                      escolherIcone(),
                      color: Colors.white,
                      size: 60,
                    ),
                  ),

                  const SizedBox(height: 20),

                  Text(
                    instrumento.nome,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 5),

                  Text(
                    instrumento.marca,
                    style: const TextStyle(
                      color: Colors.white60,
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Informações',
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 15),

                  Row(
                    children: [
                      informacao(
                        'Categoria',
                        instrumento.categoria,
                      ),

                      const SizedBox(width: 12),

                      informacao(
                        'Ano',
                        instrumento.ano.toString(),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    'Preço',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 13,
                    ),
                  ),

                  const SizedBox(height: 5),

                  Text(
                    'R\$ ${instrumento.preco.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 30),

                  const Text(
                    'Sobre o instrumento',
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    instrumento.descricao,
                    style: const TextStyle(
                      color: Colors.black54,
                      fontSize: 16,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}