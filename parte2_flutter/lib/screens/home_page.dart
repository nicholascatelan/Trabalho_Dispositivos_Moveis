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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),

      appBar: AppBar(
        backgroundColor: const Color(0xFF171717),
        foregroundColor: Colors.white,
        elevation: 0,
        title: const Row(
          children: [
            Icon(
              Icons.graphic_eq,
              size: 30,
            ),
            SizedBox(width: 10),
            Text(
              'MUSIC STORE',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
              ),
            ),
          ],
        ),
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Cabeçalho da loja
          Container(
            padding: const EdgeInsets.fromLTRB(20, 25, 20, 25),
            decoration: const BoxDecoration(
              color: Color(0xFF171717),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Encontre seu som.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'Instrumentos para todos os estilos.',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),

          // Informações do catálogo
          Padding(
            padding: const EdgeInsets.fromLTRB(18, 22, 18, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Nosso catálogo',
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    '${catalogo.quantidade} produtos',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Lista
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.fromLTRB(18, 5, 18, 110),
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

      // Total na parte inferior
      bottomNavigationBar: Container(
        padding: const EdgeInsets.fromLTRB(20, 15, 90, 15),
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'VALOR DO CATÁLOGO',
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            Text(
              'R\$ ${catalogo.valorTotal.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: abrirCadastro,
        backgroundColor: const Color(0xFF171717),
        foregroundColor: Colors.white,
        icon: const Icon(Icons.add),
        label: const Text(
          'Adicionar',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}