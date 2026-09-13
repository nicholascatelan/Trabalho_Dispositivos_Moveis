import 'package:flutter/material.dart';
import 'package:parte2_flutter/screens/instrumentos_card.dart';
import '../models/instrumento.dart';
import '../models/catalogo.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // Objeto responsável por agrupar os instrumentos.
  final Catalogo catalogo = Catalogo();

  @override
  void initState() {
    super.initState();

    // Instrumento 1
    catalogo.adicionar(
      Instrumento(
        nome: 'Violão Acústico',
        marca: 'Yamaha',
        preco: 1299.90,
        ano: 2024,
      ),
    );

    // Instrumento 2
    catalogo.adicionar(
      Instrumento(
        nome: 'Baixo',
        marca: 'Tagima',
        preco: 1899.90,
        ano: 2023,
      ),
    );

    // Instrumento 3
    catalogo.adicionar(
      Instrumento(
        nome: 'Bateria',
        marca: 'Pearl',
        preco: 5200.00,
        ano: 2022,
      ),
    );

    // Instrumento 4
    catalogo.adicionar(
      Instrumento(
        nome: 'Bateria Eletrônica',
        marca: 'Roland',
        preco: 6800.00,
        ano: 2024,
      ),
    );

    // Instrumento 5
    catalogo.adicionar(
      Instrumento(
        nome: 'Teclado Musical',
        marca: 'Casio',
        preco: 1500.00,
        ano: 2025,
      ),
    );

    // Instrumento 6
    catalogo.adicionar(
      Instrumento(
        nome: 'Guitarra Elétrica',
        marca: 'Gibson',
        preco: 4500.00,
        ano: 2025,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // Barra superior.
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

      // Corpo da tela.
      body: Column(
        // Eixo principal da Column: vertical.
        mainAxisAlignment: MainAxisAlignment.start,

        // Eixo cruzado da Column: horizontal.
        crossAxisAlignment: CrossAxisAlignment.stretch,

        children: [

          // Total do catálogo.
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

          // Lista dinâmica.
          Expanded(
            child: ListView.builder(

              // Quantidade de itens que existem no catálogo.
              itemCount: catalogo.instrumentos.length,

              // Constrói cada cartão da lista.
              itemBuilder: (context, index) {

                // Pega o instrumento pela posição da lista.
                final instrumento = catalogo.instrumentos[index];

                // Reutiliza o cartão do Exercício 6.
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
    );
  }
}