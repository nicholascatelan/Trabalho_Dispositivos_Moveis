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

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => InstrumentoDetalhes(
              instrumento: instrumento,
            ),
          ),
        );
      },

      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(8),

        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Colors.indigo,
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 5,
              offset: Offset(0, 2),
            ),
          ],
        ),

        child: ListTile(
          leading: const Icon(
            Icons.music_note,
            color: Colors.indigo,
            size: 32,
          ),

          title: Text(
            instrumento.nome,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),

          subtitle: Text(
            '${instrumento.marca} • ${instrumento.ano}',
          ),

          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'R\$ ${instrumento.preco.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(width: 8),

              IconButton(
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
                onPressed: onExcluir,
              ),
            ],
          ),
        ),
      ),
    );
  }
}