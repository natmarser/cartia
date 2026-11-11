import 'plato.dart';

/// Línea del pedido: plato y número de unidades.
class ItemPedido {
  final Plato plato;
  final int cantidad;

  const ItemPedido({required this.plato, required this.cantidad});

  double get subtotal => plato.precio * cantidad;

  String get subtotalFormateado =>
      '${subtotal.toStringAsFixed(2).replaceAll('.', ',')} €';
}
