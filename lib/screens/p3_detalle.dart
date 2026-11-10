import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class P3Detalle extends StatelessWidget {
  const P3Detalle({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('CARTIA')),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          Text('Croquetas caseras',
              style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 12),
          const Text('Crujientes por fuera, cremosas por dentro.'),
          const SizedBox(height: 24),
          Text('Precio: 8,50 €', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 24),
          Text('Ingredientes principales',
              style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          const Text('Información por confirmar con el restaurante.'),
          const SizedBox(height: 24),
          Text('Alérgenos declarados',
              style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: CartiaColors.botonSecundario,
              borderRadius: BorderRadius.circular(9),
            ),
            child: const Text('Información por confirmar'),
          ),
          const SizedBox(height: 24),
          const Text('En caso de alergia, confirma ingredientes y posibles trazas con el restaurante.'),
        ],
      ),
    );
  }
}
