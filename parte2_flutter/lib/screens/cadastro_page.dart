import 'package:flutter/material.dart';
import '../models/instrumento.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({super.key});

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final nomeController = TextEditingController();
  final marcaController = TextEditingController();
  final precoController = TextEditingController();

  @override
  void dispose() {
    nomeController.dispose();
    marcaController.dispose();
    precoController.dispose();
    super.dispose();
  }

  void confirmar() {
    final nome = nomeController.text;
    final marca = marcaController.text;

    final preco = double.tryParse(
      precoController.text.replaceAll(',', '.'),
    );

    if (nome.isEmpty || marca.isEmpty || preco == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Preencha os campos corretamente.'),
        ),
      );
      return;
    }

    final novoInstrumento = Instrumento(
      nome: nome,
      marca: marca,
      preco: preco,
      ano: 2026,
      categoria: 'Não informada',
      descricao: 'Instrumento cadastrado pelo usuário.',
    );

    Navigator.pop(context, novoInstrumento);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastrar Instrumento'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [
            TextFormField(
              controller: nomeController,
              decoration: const InputDecoration(
                labelText: 'Nome',
                prefixIcon: Icon(Icons.music_note),
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 16),

            TextFormField(
              controller: marcaController,
              decoration: const InputDecoration(
                labelText: 'Marca',
                prefixIcon: Icon(Icons.business),
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 16),

            TextFormField(
              controller: precoController,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              decoration: const InputDecoration(
                labelText: 'Preço',
                prefixIcon: Icon(Icons.attach_money),
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 24),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: confirmar,
                child: const Text('Confirmar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}