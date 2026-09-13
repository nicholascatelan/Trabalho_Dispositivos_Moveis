import 'package:flutter/material.dart';
import '../models/instrumento.dart';

class InstrumentoCard extends StatelessWidget {
  final Instrumento instrumento;

  const InstrumentoCard({
    super.key,
    required this.instrumento,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.indigo.shade100,
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),

      child: ListTile(
        contentPadding: EdgeInsets.zero,

        leading: CircleAvatar(
          backgroundColor: Colors.indigo.shade100,
          child: const Icon(
            Icons.music_note,
            color: Colors.indigo,
          ),
        ),

        title: Text(
          instrumento.nome,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
        ),

        subtitle: Text(
          '${instrumento.marca} • ${instrumento.ano}',
        ),

        trailing: Text(
          'R\$ ${instrumento.preco.toStringAsFixed(2)}',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.indigo,
          ),
        ),
      ),
    );
  }
}