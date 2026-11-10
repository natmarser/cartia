import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'p3_detalle.dart';

class P2Categoria extends StatelessWidget {
  const P2Categoria({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('CARTIA')),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          Text('Entrantes', style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 12),
          const Text('Selecciona un plato para ver sus detalles.'),
          const SizedBox(height: 24),
          Card(
            color: CartiaColors.tarjetas,
            shape: RoundedRectangleBorder(
              side: const BorderSide(color: CartiaColors.bordes),
              borderRadius: BorderRadius.circular(9),
            ),
            child: ListTile(
              title: const Text('Croquetas caseras'),
              subtitle: const Text('Crujientes por fuera, cremosas por dentro.'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (_) => const P3Detalle())),
            ),
          ),
          const SizedBox(height: 12),
          const Text('Más platos de ejemplo se añadirán posteriormente.'),
        ],
      ),
    );
  }
}
