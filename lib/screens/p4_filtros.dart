import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'p5_resultados.dart';

class P4Filtros extends StatefulWidget {
  const P4Filtros({super.key});

  @override
  State<P4Filtros> createState() => _P4FiltrosState();
}

class _P4FiltrosState extends State<P4Filtros> {
  final Set<String> seleccionados = {'Gluten'};
  final List<String> alergenos = ['Gluten', 'Leche', 'Huevo', 'Frutos secos'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('CARTIA')),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          Text('Filtros de alérgenos',
              style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 12),
          const Text('Selecciona los alérgenos que deseas evitar.'),
          const SizedBox(height: 24),
          for (final alergeno in alergenos) ...[
            CheckboxListTile(
              title: Text(alergeno),
              subtitle: Text(seleccionados.contains(alergeno)
                  ? 'Seleccionado' : 'No seleccionado'),
              value: seleccionados.contains(alergeno),
              tileColor: seleccionados.contains(alergeno)
                  ? CartiaColors.seleccionado : CartiaColors.tarjetas,
              shape: RoundedRectangleBorder(
                side: const BorderSide(color: CartiaColors.bordes),
                borderRadius: BorderRadius.circular(9),
              ),
              onChanged: (marcado) => setState(() {
                if (marcado == true) {
                  seleccionados.add(alergeno);
                } else {
                  seleccionados.remove(alergeno);
                }
              }),
            ),
            const SizedBox(height: 12),
          ],
          const SizedBox(height: 12),
          const Text('Los filtros reales se implementarán en una fase posterior.'),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () => Navigator.push(context,
              MaterialPageRoute(builder: (_) => const P5Resultados())),
            child: const Text('Ver resultados de ejemplo'),
          ),
          const SizedBox(height: 12),
          OutlinedButton(
            onPressed: () => setState(() => seleccionados.clear()),
            child: const Text('Restablecer filtros'),
          ),
        ],
      ),
    );
  }
}
