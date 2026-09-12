import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Loja de Instrumentos'),
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,

        children: [
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Valor total: R\$ 15.199,80',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          Expanded(
            child: ListView(
              children: const [
                ListTile(
                  title: Text('Violão Acústico'),
                  subtitle: Text('Yamaha - R\$ 1.299,90'),
                ),
                ListTile(
                  title: Text('Baixo'),
                  subtitle: Text('Tagima - R\$ 1.899,90'),
                ),
                ListTile(
                  title: Text('Bateria'),
                  subtitle: Text('Pearl - R\$ 5.200,00'),
                ),
                ListTile(
                  title: Text('Bateria Eletrônica'),
                  subtitle: Text('Roland - R\$ 6.800,00'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}