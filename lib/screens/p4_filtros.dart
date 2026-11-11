import 'package:flutter/material.dart';
import '../data/carta.dart';
import '../theme/app_theme.dart';
import '../widgets/cartia_widgets.dart';
import 'p5_resultados.dart';

class P4Filtros extends StatefulWidget {
  const P4Filtros({super.key});
  @override
  State<P4Filtros> createState() => _P4FiltrosState();
}

class _P4FiltrosState extends State<P4Filtros> {
  final Set<String> seleccionados = {};

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: const CartiaHeader(),
    body: FondoOndas(child: ListView(
      padding: const EdgeInsets.all(24),
      children: [
        Text('Filtros de alérgenos',
          style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: 12),
        Text('Selecciona los alérgenos que deseas excluir de los resultados.',
          style: Theme.of(context).textTheme.bodyLarge),
        const SizedBox(height: 20),
        Text('${seleccionados.length} seleccionados',
          style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 12),
        for (final alergeno in Carta.alergenos) ...[
          Material(
            color: seleccionados.contains(alergeno)
              ? CartiaColors.seleccionado : Colors.white,
            shape: RoundedRectangleBorder(
              side: const BorderSide(color: CartiaColors.bordes, width: 1.4),
              borderRadius: BorderRadius.circular(14)),
            child: CheckboxListTile(
              title: Text(alergeno, style: Theme.of(context).textTheme.titleMedium),
              subtitle: Text(seleccionados.contains(alergeno)
                ? 'Seleccionado para excluir' : 'No seleccionado'),
              value: seleccionados.contains(alergeno),
              controlAffinity: ListTileControlAffinity.leading,
              contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
              onChanged: (valor) => setState(() {
                if (valor == true) { seleccionados.add(alergeno); }
                else { seleccionados.remove(alergeno); }
              }),
            ),
          ),
          const SizedBox(height: 10),
        ],
        const SizedBox(height: 10),
        CartiaBoton(texto: 'Aplicar filtros', icono: Icons.tune,
          onPressed: () => Navigator.push(context,
            MaterialPageRoute(builder: (_) => P5Resultados.filtrados(
              alergenosExcluidos: Set.of(seleccionados))))),
        const SizedBox(height: 12),
        CartiaBoton(texto: 'Restablecer filtros', icono: Icons.restart_alt,
          secundario: true,
          onPressed: seleccionados.isEmpty ? null
            : () => setState(seleccionados.clear)),
        const SizedBox(height: 24),
        const AvisoAlergenos(),
      ],
    )),
  );
}
