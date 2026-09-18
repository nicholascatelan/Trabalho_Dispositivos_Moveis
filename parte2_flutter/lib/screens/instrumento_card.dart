import 'package:flutter/material.dart';
import '../models/instrumento.dart';
import 'instrumento_detalhes.dart';

class InstrumentoCard extends StatelessWidget {
  final Instrumento instrumento;
  final VoidCallback onExcluir;

  const InstrumentoCard({
    super.key,
    required this.instrumento,
    required this.onExcluir,
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

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, 3),
          ),
        ],
      ),

      child: InkWell(
        borderRadius: BorderRadius.circular(18),

        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => InstrumentoDetalhes(
                instrumento: instrumento,
              ),
            ),
          );
        },

        child: Padding(
          padding: const EdgeInsets.all(16),

          child: Row(
            children: [
              // Ícone
              Container(
                width: 65,
                height: 65,
                decoration: BoxDecoration(
                  color: const Color(0xFFF0F0F0),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(
                  escolherIcone(),
                  size: 34,
                  color: Colors.black87,
                ),
              ),

              const SizedBox(width: 15),

              // Informações
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      instrumento.nome,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 4),

                    Text(
                      instrumento.marca,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 9,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF0F0F0),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        instrumento.categoria,
                        style: const TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),

                    const SizedBox(height: 10),

                    Text(
                      'R\$ ${instrumento.preco.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              // Excluir
              IconButton(
                tooltip: 'Excluir',
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Excluir instrumento'),
                        content: Text(
                          'Deseja excluir ${instrumento.nome} do catálogo?',
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Cancelar'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              onExcluir();
                            },
                            child: const Text(
                              'Excluir',
                              style: TextStyle(
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
                icon: const Icon(
                  Icons.delete_outline,
                  color: Colors.redAccent,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}