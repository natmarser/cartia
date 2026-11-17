import 'package:flutter/material.dart';
import '../providers/pedido_controller.dart';
import '../theme/app_theme.dart';
import '../widgets/cartia_widgets.dart';

class P8Confirmacion extends StatelessWidget {
  final PedidoDemo recibo;
  const P8Confirmacion({super.key, required this.recibo});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: const CartiaHeader(excludeHeaderSemantics: true),
    body: FondoOndas(child: ListView(
      padding: const EdgeInsets.all(24),
      children: [
        const Icon(Icons.check_circle_outline, size: 68,
          color: CartiaColors.exito),
        const SizedBox(height: 14),
        Semantics(
          header: true,
          namesRoute: true,
          child: Text('Pedido de demostración confirmado',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium)),
        const SizedBox(height: 10),
        Text('Referencia local: ${recibo.referencia}',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: CartiaColors.botonSecundario,
            border: Border.all(color: CartiaColors.bordes),
            borderRadius: BorderRadius.circular(16)),
          child: const Text(
            'Este pedido se ha registrado únicamente en la demostración. '
            'No se ha enviado al restaurante ni se ha realizado ningún pago.',
            style: TextStyle(fontSize: 16, color: CartiaColors.texto, height: 1.4)),
        ),
        const SizedBox(height: 24),
        const TituloSeccion('Resumen'),
        for (final item in recibo.items)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Expanded(child: Text('${item.cantidad} × ${item.plato.nombre}',
                style: Theme.of(context).textTheme.bodyLarge)),
              const SizedBox(width: 12),
              Text(item.subtotalFormateado,
                style: Theme.of(context).textTheme.bodyLarge),
            ]),
          ),
        const Divider(height: 28),
        Row(children: [
          Expanded(child: Text('Total',
            style: Theme.of(context).textTheme.titleLarge)),
          Text(recibo.totalFormateado,
            style: Theme.of(context).textTheme.titleLarge),
        ]),
        const SizedBox(height: 26),
        CartiaBoton(
          texto: 'Volver a la carta', icono: Icons.home_outlined,
          onPressed: () => Navigator.of(context).popUntil((route) => route.isFirst),
        ),
      ],
    )),
  );
}
