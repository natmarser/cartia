import 'package:flutter/material.dart';
import '../models/plato.dart';
import '../providers/pedido_controller.dart';
import '../theme/app_theme.dart';
import '../widgets/cartia_widgets.dart';
import 'p7_pedido.dart';

class P3Detalle extends StatefulWidget {
  final Plato plato;
  const P3Detalle({super.key, required this.plato});

  @override
  State<P3Detalle> createState() => _P3DetalleState();
}

class _P3DetalleState extends State<P3Detalle> {
  int cantidad = 1;

  void _anadir() {
    final plato = widget.plato;
    PedidoScope.of(context).agregar(plato, cantidad: cantidad);
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('$cantidad ${cantidad == 1 ? 'unidad añadida' : 'unidades añadidas'} al pedido: ${plato.nombre}'),
      action: SnackBarAction(
        label: 'Ver pedido',
        onPressed: () => Navigator.push(context,
          MaterialPageRoute(builder: (_) => const P7Pedido())),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    final plato = widget.plato;
    return Scaffold(
      appBar: const CartiaHeader(),
      body: FondoOndas(child: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          Text(plato.categoria.toUpperCase(), style: const TextStyle(
            color: CartiaColors.botonPrincipal, fontWeight: FontWeight.w800,
            letterSpacing: .6)),
          const SizedBox(height: 10),
          Text(plato.nombre, style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 14),
          Text(plato.descripcion, style: Theme.of(context).textTheme.bodyLarge),
          const SizedBox(height: 18),
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: CartiaColors.bordes, width: 1.5),
              borderRadius: BorderRadius.circular(16)),
            
            child: Row(
              children: [
                const Icon(
                  Icons.payments_outlined,
                  color: CartiaColors.botonPrincipal,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Precio por unidad',
                    style: const TextStyle(fontSize: 16),
                    softWrap: true,
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                    plato.precioFormateado,
                    style: Theme.of(context).textTheme.titleMedium,
                    textAlign: TextAlign.end,
                  ),

              ],
            ),

          ),
          const SizedBox(height: 24),
          const TituloSeccion('Ingredientes principales'),
          Text(plato.ingredientes.join(', '),
            style: Theme.of(context).textTheme.bodyLarge),
          const SizedBox(height: 24),
          const TituloSeccion('Alérgenos declarados'),
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: CartiaColors.botonSecundario,
              border: Border.all(color: CartiaColors.bordes),
              borderRadius: BorderRadius.circular(16)),
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Icon(Icons.info_outline, color: CartiaColors.botonPrincipal),
              const SizedBox(width: 12),
              Expanded(child: Text(plato.alergenosDeclarados.isEmpty
                ? 'No hay alérgenos declarados en estos datos ficticios. No significa que el plato esté libre de alérgenos o trazas.'
                : (plato.alergenosDeclarados.toList()..sort()).join(', '),
                style: Theme.of(context).textTheme.bodyLarge)),
            ]),
          ),
          const SizedBox(height: 24),
          const AvisoAlergenos(),
          const SizedBox(height: 24),
          const TituloSeccion('Añadir al pedido'),
          _SelectorCantidad(
            cantidad: cantidad,
            nombre: plato.nombre,
            onMenos: cantidad > 1 ? () => setState(() => cantidad--) : null,
            onMas: () => setState(() => cantidad++),
          ),
          const SizedBox(height: 14),
          CartiaBoton(
            texto: 'Añadir $cantidad al pedido',
            icono: Icons.add_shopping_cart,
            onPressed: _anadir,
          ),
          const SizedBox(height: 12),
          CartiaBoton(
            texto: 'Ver mi pedido',
            icono: Icons.shopping_basket_outlined,
            secundario: true,
            onPressed: () => Navigator.push(context,
              MaterialPageRoute(builder: (_) => const P7Pedido())),
          ),
          const SizedBox(height: 12),
          CartiaBoton(
            texto: 'Volver al listado',
            icono: Icons.arrow_back,
            secundario: true,
            onPressed: () => Navigator.pop(context),
          ),
        ],
      )),
    );
  }
}

class _SelectorCantidad extends StatelessWidget {
  final int cantidad;
  final String nombre;
  final VoidCallback? onMenos;
  final VoidCallback onMas;

  const _SelectorCantidad({
    required this.cantidad,
    required this.nombre,
    required this.onMenos,
    required this.onMas,
  });

  @override
  Widget build(BuildContext context) => Row(children: [
    IconButton.outlined(
      tooltip: 'Disminuir cantidad de $nombre',
      constraints: const BoxConstraints(minWidth: 48, minHeight: 48),
      onPressed: onMenos,
      icon: const Icon(Icons.remove),
    ),
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Semantics(
        label: 'Cantidad seleccionada: $cantidad',
        child: Text('$cantidad', style: Theme.of(context).textTheme.titleLarge),
      ),
    ),
    IconButton.outlined(
      tooltip: 'Aumentar cantidad de $nombre',
      constraints: const BoxConstraints(minWidth: 48, minHeight: 48),
      onPressed: onMas,
      icon: const Icon(Icons.add),
    ),
  ]);
}
