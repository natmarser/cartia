import 'package:flutter/material.dart';
import '../models/item_pedido.dart';
import '../providers/pedido_controller.dart';
import '../theme/app_theme.dart';
import '../widgets/cartia_widgets.dart';
import 'p8_confirmacion.dart';

class P7Pedido extends StatefulWidget {
  const P7Pedido({super.key});

  @override
  State<P7Pedido> createState() => _P7PedidoState();
}

class _P7PedidoState extends State<P7Pedido> {
  bool _revisionConfirmada = false;

  void _confirmar(PedidoController pedido) {
    if (pedido.estaVacio || !_revisionConfirmada) return;
    final recibo = pedido.confirmarDemo();
    Navigator.pushReplacement(context,
      MaterialPageRoute(builder: (_) => P8Confirmacion(recibo: recibo)));
  }

  @override
  Widget build(BuildContext context) {
    final pedido = PedidoScope.of(context);
    return Scaffold(
      appBar: const CartiaHeader(),
      body: FondoOndas(child: ListView(
        padding: const EdgeInsets.fromLTRB(24, 22, 24, 36),
        children: [
          Text('Mi pedido', style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 8),
          const Text('Pedido de demostración: no se enviará al restaurante.',
            style: TextStyle(color: CartiaColors.textoSecundario, fontSize: 15)),
          const SizedBox(height: 22),
          if (pedido.estaVacio) ...[
            const Icon(Icons.shopping_basket_outlined, size: 60,
              color: CartiaColors.botonPrincipal),
            const SizedBox(height: 14),
            Text('Todavía no has añadido platos.',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 22),
            CartiaBoton(texto: 'Volver a la carta', icono: Icons.arrow_back,
              onPressed: () => Navigator.pop(context)),
          ] else ...[
            Text('${pedido.unidades} unidades en tu pedido',
              style: Theme.of(context).textTheme.bodyLarge),
            const SizedBox(height: 14),
            for (final item in pedido.items) _LineaPedido(
              key: ValueKey(item.plato.id),
              item: item,
              onMenos: () {
                pedido.cambiarCantidad(item.plato, item.cantidad - 1);
                setState(() => _revisionConfirmada = false);
              },
              onMas: () {
                pedido.cambiarCantidad(item.plato, item.cantidad + 1);
                setState(() => _revisionConfirmada = false);
              },
              onEliminar: () {
                pedido.eliminar(item.plato);
                setState(() => _revisionConfirmada = false);
              },
            ),
            const SizedBox(height: 10),
            const Divider(height: 28),
            Row(children: [
              Expanded(child: Text('Total',
                style: Theme.of(context).textTheme.titleLarge)),
              Text(pedido.totalFormateado,
                style: Theme.of(context).textTheme.titleLarge),
            ]),
            const SizedBox(height: 22),
            const AvisoAlergenos(),
            const SizedBox(height: 12),
            CheckboxListTile(
              value: _revisionConfirmada,
              onChanged: (v) => setState(() => _revisionConfirmada = v ?? false),
              controlAffinity: ListTileControlAffinity.leading,
              contentPadding: EdgeInsets.zero,
              title: const Text('He revisado los platos y sus alérgenos declarados.'),
              subtitle: const Text('El pedido es una simulación y no se enviará a cocina.'),
            ),
            const SizedBox(height: 12),
            CartiaBoton(
              texto: 'Confirmar pedido de demostración',
              icono: Icons.check_circle_outline,
              onPressed: _revisionConfirmada ? () => _confirmar(pedido) : null,
            ),
            const SizedBox(height: 12),
            CartiaBoton(
              texto: 'Seguir añadiendo platos',
              icono: Icons.arrow_back,
              secundario: true,
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ],
      )),
    );
  }
}

class _LineaPedido extends StatelessWidget {
  final ItemPedido item;
  final VoidCallback onMenos;
  final VoidCallback onMas;
  final VoidCallback onEliminar;

  const _LineaPedido({
    super.key,
    required this.item,
    required this.onMenos,
    required this.onMas,
    required this.onEliminar,
  });

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(bottom: 14),
    child: Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: CartiaColors.tarjetas,
        border: Border.all(color: CartiaColors.bordes, width: 1.4),
        borderRadius: BorderRadius.circular(16)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(item.plato.nombre, style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 4),
        Text('Precio por unidad: ${item.plato.precioFormateado}',
          style: Theme.of(context).textTheme.bodyMedium),
        const SizedBox(height: 4),
        Text('Alérgenos declarados: ${item.plato.alergenosDeclarados.isEmpty ? 'ninguno en los datos ficticios' : (item.plato.alergenosDeclarados.toList()..sort()).join(', ')}',
          style: Theme.of(context).textTheme.bodyMedium),
        const SizedBox(height: 12),
        Wrap(crossAxisAlignment: WrapCrossAlignment.center, spacing: 8, runSpacing: 8,
          children: [
            IconButton.outlined(
              tooltip: 'Quitar una unidad de ${item.plato.nombre}',
              constraints: const BoxConstraints(minWidth: 48, minHeight: 48),
              onPressed: onMenos, icon: const Icon(Icons.remove)),
            Semantics(label: '${item.cantidad} unidades',
              child: Padding(padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Text('${item.cantidad}',
                  style: Theme.of(context).textTheme.titleMedium))),
            IconButton.outlined(
              tooltip: 'Añadir una unidad de ${item.plato.nombre}',
              constraints: const BoxConstraints(minWidth: 48, minHeight: 48),
              onPressed: onMas, icon: const Icon(Icons.add)),
            Text(item.subtotalFormateado,
              style: const TextStyle(color: CartiaColors.botonPrincipal,
                fontWeight: FontWeight.w800, fontSize: 17)),
            IconButton.outlined(
              tooltip: 'Eliminar ${item.plato.nombre} del pedido',
              constraints: const BoxConstraints(minWidth: 48, minHeight: 48),
              onPressed: onEliminar, icon: const Icon(Icons.delete_outline)),
          ]),
      ]),
    ),
  );
}
