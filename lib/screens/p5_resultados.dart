import 'package:flutter/material.dart';
import '../data/carta.dart';
import '../models/plato.dart';
import '../theme/app_theme.dart';
import '../widgets/cartia_widgets.dart';

class P5Resultados extends StatelessWidget {
  final String? consulta;
  final Set<String>? alergenosExcluidos;

  const P5Resultados.busqueda({super.key, required String texto})
    : consulta = texto, alergenosExcluidos = null;
  const P5Resultados.filtrados({super.key, required this.alergenosExcluidos})
    : consulta = null;

  @override
  Widget build(BuildContext context) {
    final esBusqueda = consulta != null;
    final List<Plato> resultados = esBusqueda
      ? Carta.buscar(consulta!)
      : Carta.sinAlergenosDeclarados(alergenosExcluidos!);
    final descripcion = esBusqueda
      ? 'Búsqueda: «${consulta!.trim()}»'
      : alergenosExcluidos!.isEmpty
        ? 'No has seleccionado ningún alérgeno para excluir.'
        : 'Excluidos: ${(alergenosExcluidos!.toList()..sort()).join(', ')}';

    // Nombre accesible de la nueva pantalla, anunciado por TalkBack
    // al entrar sin convertir la lista completa en un anuncio automático.
    final resumenRuta = esBusqueda
      ? 'Resultados de búsqueda. Búsqueda: ${consulta!.trim()}. '
        '${resultados.length} ${resultados.length == 1 ? 'plato encontrado' : 'platos encontrados'}.'
      : 'Resultados de filtros. '
        '${alergenosExcluidos!.isEmpty ? 'No hay alérgenos excluidos' : 'Alérgenos excluidos: ${(alergenosExcluidos!.toList()..sort()).join(', ')}'}. '
        '${resultados.length} ${resultados.length == 1 ? 'plato encontrado' : 'platos encontrados'}.';

    return Scaffold(
      appBar: const CartiaHeader(excludeHeaderSemantics: true),
      body: FondoOndas(child: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          Semantics(
            header: true,
            namesRoute: true,
            label: resumenRuta,
            excludeSemantics: true,
            child: Text(
              esBusqueda ? 'Resultados de búsqueda' : 'Resultados de filtros',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          const SizedBox(height: 12),
          Text(descripcion, style: Theme.of(context).textTheme.bodyLarge),
          const SizedBox(height: 16),
          Container(padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(color: CartiaColors.botonSecundario,
              borderRadius: BorderRadius.circular(14)),
            child: Text('${resultados.length} ${resultados.length == 1 ? 'plato encontrado' : 'platos encontrados'}',
              style: Theme.of(context).textTheme.titleMedium)),
          const SizedBox(height: 20),
          if (resultados.isEmpty) ...[
            const Icon(Icons.search_off_outlined, size: 48,
              color: CartiaColors.botonPrincipal),
            const SizedBox(height: 12),
            const Text('No hay platos que coincidan con tu selección.',
              textAlign: TextAlign.center),
            const SizedBox(height: 8),
            const Text('Modifica los filtros o introduce otra palabra.',
              textAlign: TextAlign.center),
            const SizedBox(height: 20),
          ] else
            for (final plato in resultados) TarjetaPlato(plato: plato),
          const SizedBox(height: 12),
          CartiaBoton(texto: esBusqueda ? 'Modificar búsqueda' : 'Modificar filtros',
            icono: Icons.edit_outlined, secundario: true,
            onPressed: () => Navigator.pop(context)),
          const SizedBox(height: 24),
          const AvisoAlergenos(),
        ],
      )),
    );
  }
}
