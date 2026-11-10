import 'package:flutter/material.dart';
import 'p5_resultados.dart';

class P6Busqueda extends StatelessWidget {
  const P6Busqueda({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('CARTIA')),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          Text('Buscar un plato', style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 12),
          const Text('Encuentra un plato por su nombre.'),
          const SizedBox(height: 24),
          const TextField(
            decoration: InputDecoration(
              labelText: 'Nombre del plato',
              hintText: 'Ej. croquetas',
            ),
          ),
          const SizedBox(height: 12),
          const Text('La búsqueda real se implementará más adelante.'),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () => Navigator.push(context,
              MaterialPageRoute(builder: (_) => const P5Resultados())),
            child: const Text('Ver resultados de ejemplo'),
          ),
        ],
      ),
    );
  }
}
