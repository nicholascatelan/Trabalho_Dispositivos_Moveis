import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // Barra superior da tela
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

      // Corpo da tela
      body: Column(

        // Controla o eixo vertical
        mainAxisAlignment: MainAxisAlignment.start,

        // Controla o eixo horizontal
        crossAxisAlignment: CrossAxisAlignment.stretch,

        children: [

          // Total do Exercício 4
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(20),

            decoration: BoxDecoration(
              color: Colors.indigo,
              borderRadius: BorderRadius.circular(16),
            ),

            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Valor total do catálogo',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 15,
                  ),
                ),

                SizedBox(height: 5),

                Text(
                  'R\$ 15.199,80',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}