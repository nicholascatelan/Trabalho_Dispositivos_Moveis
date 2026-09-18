import 'package:flutter/material.dart';
import 'Tema.dart';
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
        descricao: 'Violão acústico indicado para estudos e apresentações.',
      ),
    );

    catalogo.adicionar(
      Instrumento(
        nome: 'Baixo',
        marca: 'Tagima',
        preco: 1899.90,
        ano: 2023,
        categoria: 'Cordas',
        descricao: 'Baixo elétrico utilizado principalmente em bandas.',
      ),
    );

    catalogo.adicionar(
      Instrumento(
        nome: 'Bateria',
        marca: 'Pearl',
        preco: 5200.00,
        ano: 2022,
        categoria: 'Percussão',
        descricao: 'Bateria acústica completa para ensaios e apresentações.',
      ),
    );

    catalogo.adicionar(
      Instrumento(
        nome: 'Bateria Eletrônica',
        marca: 'Roland',
        preco: 6800.00,
        ano: 2024,
        categoria: 'Percussão',
        descricao: 'Bateria eletrônica com diferentes sons e controle de volume.',
      ),
    );

    catalogo.adicionar(
      Instrumento(
        nome: 'Teclado Musical',
        marca: 'Casio',
        preco: 1500.00,
        ano: 2025,
        categoria: 'Teclas',
        descricao: 'Teclado musical indicado para estudo e apresentações.',
      ),
    );

    catalogo.adicionar(
      Instrumento(
        nome: 'Guitarra Elétrica',
        marca: 'Gibson',
        preco: 4500.00,
        ano: 2025,
        categoria: 'Cordas',
        descricao: 'Guitarra elétrica voltada para apresentações e gravações.',
      ),
    );
  }

  Future<void> abrirCadastro() async {
    final novoInstrumento = await Navigator.of(context).push<Instrumento>(
      MaterialPageRoute(
        builder: (context) => const CadastroPage(),
      ),
    );

    if (novoInstrumento != null) {
      setState(() {
        catalogo.adicionar(novoInstrumento);
      });
    }
  }

  void excluirInstrumento(Instrumento instrumento) {
    setState(() {
      catalogo.excluir(instrumento);
    });
  }

  // Cabeçalho escuro com o total do catálogo (exercício 4) no topo.
  Widget cabecalho() {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 24),
      decoration: const BoxDecoration(
        color: Tema.tinta,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(28),
          bottomRight: Radius.circular(28),
        ),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Encontre seu som',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.w700,
              height: 1.1,
            ),
          ),

          const SizedBox(height: 6),

          const Text(
            'Instrumentos para todos os estilos.',
            style: TextStyle(color: Colors.white60, fontSize: 15),
          ),

          const SizedBox(height: 22),

          // Painel do total — valor calculado pelo getter do catálogo.
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: Colors.white24),
            ),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Valor do catálogo',
                      style: TextStyle(color: Colors.white60, fontSize: 13),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'R\$ ${catalogo.valorTotal.toStringAsFixed(2)}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Tema.latao,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(
                    '${catalogo.quantidade} itens',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(Icons.graphic_eq, size: 26, color: Tema.latao),
            SizedBox(width: 10),
            Text(
              'Music Store',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
            ),
          ],
        ),
      ),

      // Os dois alinhamentos declarados: exigência do exercício 5.
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          cabecalho(),

          Padding(
            padding: const EdgeInsets.fromLTRB(20, 24, 20, 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Nosso catálogo',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Tema.tinta,
                  ),
                ),
                Text(
                  'toque para ver o detalhe',
                  style: TextStyle(fontSize: 12, color: Tema.texto),
                ),
              ],
            ),
          ),

          // Expanded resolve o conflito de altura entre ListView e Column.
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 100),
              itemCount: catalogo.instrumentos.length,
              itemBuilder: (context, index) {
                final instrumento = catalogo.instrumentos[index];

                return InstrumentoCard(
                  instrumento: instrumento,
                  onExcluir: () {
                    excluirInstrumento(instrumento);
                  },
                );
              },
            ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: abrirCadastro,
        backgroundColor: Tema.latao,
        foregroundColor: Colors.white,
        icon: const Icon(Icons.add),
        label: const Text(
          'Adicionar',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
