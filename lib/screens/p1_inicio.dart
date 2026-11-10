import 'package:flutter/material.dart';
import 'p2_categoria.dart';
import 'p4_filtros.dart';
import 'p6_busqueda.dart';

class P1Inicio extends StatelessWidget {
  const P1Inicio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('CARTIA')),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          Text('Nuestra carta', style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 12),
          const Text('Explora las categorías y consulta la información de cada plato.'),
          const SizedBox(height: 24),
          Text('Categorías', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 12),
          OutlinedButton(
            onPressed: () => Navigator.push(context,
              MaterialPageRoute(builder: (_) => const P2Categoria())),
            child: const Text('Entrantes'),
          ),
          const SizedBox(height: 12),
          const Text('Las demás categorías se añadirán más adelante.'),
          const SizedBox(height: 24),
          Text('Otras opciones', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () => Navigator.push(context,
              MaterialPageRoute(builder: (_) => const P6Busqueda())),
            child: const Text('Buscar'),
          ),
          const SizedBox(height: 12),
          OutlinedButton(
            onPressed: () => Navigator.push(context,
              MaterialPageRoute(builder: (_) => const P4Filtros())),
            child: const Text('Filtros de alérgenos'),
          ),
          const SizedBox(height: 24),
          Text('Consulta con el restaurante la información sobre alérgenos.',
            style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
    );
  }
}
