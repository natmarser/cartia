import 'package:flutter/material.dart';
import '../data/carta.dart';
import '../widgets/cartia_widgets.dart';

class P2Categoria extends StatelessWidget {
  final String categoria;
  const P2Categoria({super.key, required this.categoria});

  @override
  Widget build(BuildContext context) {
    final platos = Carta.porCategoria(categoria);
    return Scaffold(
      appBar: const CartiaHeader(),
      body: FondoOndas(child: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          Text(categoria, style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 12),
          Text('${platos.length} platos disponibles. Selecciona uno para ver sus detalles.'),
          const SizedBox(height: 24),
          for (final plato in platos) TarjetaPlato(plato: plato),
          const SizedBox(height: 18),
          const AvisoAlergenos(),
        ],
      )),
    );
  }
}
