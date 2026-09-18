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
    final nome = nomeController.text.trim();
    final marca = marcaController.text.trim();

    final preco = double.tryParse(
      precoController.text.replaceAll(',', '.'),
    );

    if (nome.isEmpty || marca.isEmpty || preco == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Preencha todos os campos corretamente.',
          ),
        ),
      );

      return;
    }

    final novoInstrumento = Instrumento(
      nome: nome,
      marca: marca,
      preco: preco,
      ano: 2026,
      categoria: 'Outros',
      descricao: 'Instrumento cadastrado pelo usuário.',
    );

    Navigator.pop(context, novoInstrumento);
  }

  InputDecoration campoDecoration({
    required String titulo,
    required String dica,
    required IconData icone,
  }) {
    return InputDecoration(
      labelText: titulo,
      hintText: dica,
      prefixIcon: Icon(icone),
      filled: true,
      fillColor: const Color(0xFFF5F5F5),

      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide.none,
      ),

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide.none,
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(
          color: Colors.black,
          width: 1.5,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        title: const Text('Novo instrumento'),
        backgroundColor: const Color(0xFF171717),
        foregroundColor: Colors.white,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(22),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(
              Icons.library_music,
              size: 45,
            ),

            const SizedBox(height: 15),

            const Text(
              'Adicionar ao catálogo',
              style: TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 7),

            const Text(
              'Preencha as informações do instrumento.',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 15,
              ),
            ),

            const SizedBox(height: 30),

            TextFormField(
              controller: nomeController,
              decoration: campoDecoration(
                titulo: 'Nome',
                dica: 'Ex: Guitarra Les Paul',
                icone: Icons.music_note,
              ),
            ),

            const SizedBox(height: 18),

            TextFormField(
              controller: marcaController,
              decoration: campoDecoration(
                titulo: 'Marca',
                dica: 'Ex: Gibson',
                icone: Icons.business,
              ),
            ),

            const SizedBox(height: 18),

            TextFormField(
              controller: precoController,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              decoration: campoDecoration(
                titulo: 'Preço',
                dica: 'Ex: 4500,00',
                icone: Icons.attach_money,
              ),
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton.icon(
                onPressed: confirmar,

                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF171717),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),

                icon: const Icon(Icons.add),
                label: const Text(
                  'ADICIONAR AO CATÁLOGO',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}