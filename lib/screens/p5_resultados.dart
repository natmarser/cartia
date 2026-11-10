import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'p3_detalle.dart';

class P5Resultados extends StatelessWidget {
  const P5Resultados({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('CARTIA')),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          Text('Resultados', style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 12),
          const Text('Vista provisional para comprobar la navegación.'),
          const SizedBox(height: 12),
          const Text('Aún no se calcula ningún resultado de búsqueda ni filtro.'),
          const SizedBox(height: 24),
          Text('Plato de ejemplo', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 12),
          Card(
            color: CartiaColors.tarjetas,
            shape: RoundedRectangleBorder(
              side: const BorderSide(color: CartiaColors.bordes),
              borderRadius: BorderRadius.circular(9),
            ),
            child: ListTile(
              title: const Text('Croquetas caseras'),
              subtitle: const Text('Abrir detalle de ejemplo'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (_) => const P3Detalle())),
            ),
          ),
        ],
      ),
    );
  }
}
