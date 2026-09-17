import 'package:flutter/material.dart';
import '../models/instrumento.dart';
import '../models/catalogo.dart';
import 'instrumento_card.dart';
import 'cadastro_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Catalogo catalogo = Catalogo();

  @override
  void initState() {
    super.initState();

    catalogo.adicionar(
      Instrumento(
        nome: 'Violão Acústico',
        marca: 'Yamaha',
        preco: 1299.90,
        ano: 2024,
        categoria: 'Cordas',
        descricao:
            'Violão acústico indicado para estudos e apresentações.',
      ),
    );

    catalogo.adicionar(
      Instrumento(
        nome: 'Baixo',
        marca: 'Tagima',
        preco: 1899.90,
        ano: 2023,
        categoria: 'Cordas',
        descricao:
            'Baixo elétrico utilizado principalmente em bandas.',
      ),
    );

    catalogo.adicionar(
      Instrumento(
        nome: 'Bateria',
        marca: 'Pearl',
        preco: 5200.00,
        ano: 2022,
        categoria: 'Percussão',
        descricao:
            'Bateria acústica completa para ensaios e apresentações.',
      ),
    );

    catalogo.adicionar(
      Instrumento(
        nome: 'Bateria Eletrônica',
        marca: 'Roland',
        preco: 6800.00,
        ano: 2024,
        categoria: 'Percussão',
        descricao:
            'Bateria eletrônica com diferentes sons e controle de volume.',
      ),
    );

    catalogo.adicionar(
      Instrumento(
        nome: 'Teclado Musical',
        marca: 'Casio',
        preco: 1500.00,
        ano: 2025,
        categoria: 'Teclas',
        descricao:
            'Teclado musical indicado para estudo e apresentações.',
      ),
    );

    catalogo.adicionar(
      Instrumento(
        nome: 'Guitarra Elétrica',
        marca: 'Gibson',
        preco: 4500.00,
        ano: 2025,
        categoria: 'Cordas',
        descricao:
            'Guitarra elétrica voltada para apresentações e gravações.',
      ),
    );
  }

  // Abre a tela de cadastro e espera um novo instrumento.
  Future<void> abrirCadastro() async {
    final novoInstrumento = await Navigator.of(context).push<Instrumento>(
      MaterialPageRoute(
        builder: (context) => const CadastroPage(),
      ),
    );

    // Se um instrumento foi cadastrado, adiciona na lista
    // e atualiza a tela.
    if (novoInstrumento != null) {
      setState(() {
        catalogo.adicionar(novoInstrumento);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Loja de Instrumentos',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Valor total do catálogo
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.indigo,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Valor total do catálogo',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  'R\$ ${catalogo.valorTotal.toStringAsFixed(2)}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          // Lista de instrumentos
          Expanded(
            child: ListView.builder(
              itemCount: catalogo.instrumentos.length,
              itemBuilder: (context, index) {
                final instrumento = catalogo.instrumentos[index];

                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  child: InstrumentoCard(
                    instrumento: instrumento,
                  ),
                );
              },
            ),
          ),
        ],
      ),

      // Botão para cadastrar um novo instrumento
      floatingActionButton: FloatingActionButton(
        onPressed: abrirCadastro,
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),
    );
  }
}