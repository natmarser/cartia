import 'package:flutter/widgets.dart';
import '../models/item_pedido.dart';
import '../models/plato.dart';

/// Estado del carrito. Solo funciona en memoria durante esta sesión.
class PedidoController extends ChangeNotifier {
  final Map<String, ItemPedido> _lineas = {};
  int _siguienteNumero = 1;

  List<ItemPedido> get items => List.unmodifiable(_lineas.values);
  bool get estaVacio => _lineas.isEmpty;
  int get unidades => _lineas.values.fold(0, (total, item) => total + item.cantidad);
  double get total => _lineas.values.fold(0.0, (total, item) => total + item.subtotal);
  String get totalFormateado => '${total.toStringAsFixed(2).replaceAll('.', ',')} €';

  int cantidadDe(Plato plato) => _lineas[plato.id]?.cantidad ?? 0;

  void agregar(Plato plato, {int cantidad = 1}) {
    if (cantidad <= 0) return;
    final actual = cantidadDe(plato);
    _lineas[plato.id] = ItemPedido(plato: plato, cantidad: actual + cantidad);
    notifyListeners();
  }

  void cambiarCantidad(Plato plato, int cantidad) {
    if (cantidad <= 0) {
      eliminar(plato);
      return;
    }
    if (!_lineas.containsKey(plato.id)) return;
    _lineas[plato.id] = ItemPedido(plato: plato, cantidad: cantidad);
    notifyListeners();
  }

  void eliminar(Plato plato) {
    if (_lineas.remove(plato.id) != null) notifyListeners();
  }

  void vaciar() {
    if (_lineas.isEmpty) return;
    _lineas.clear();
    notifyListeners();
  }

  /// Crea un recibo de demostración y vacía el carrito.
  /// No transmite ningún pedido a un restaurante.
  PedidoDemo confirmarDemo() {
    if (estaVacio) throw StateError('No se puede confirmar un pedido vacío');
    final recibo = PedidoDemo(
      numero: _siguienteNumero++,
      fecha: DateTime.now(),
      items: List.unmodifiable(items),
      total: total,
    );
    vaciar();
    return recibo;
  }
}

class PedidoDemo {
  final int numero;
  final DateTime fecha;
  final List<ItemPedido> items;
  final double total;

  const PedidoDemo({
    required this.numero,
    required this.fecha,
    required this.items,
    required this.total,
  });

  String get referencia => 'DEMO-${numero.toString().padLeft(4, '0')}';
  String get totalFormateado => '${total.toStringAsFixed(2).replaceAll('.', ',')} €';
}

/// Permite compartir un único carrito entre todas las rutas sin paquetes externos.
class PedidoScope extends InheritedNotifier<PedidoController> {
  const PedidoScope({
    super.key,
    required PedidoController controller,
    required super.child,
  }) : super(notifier: controller);

  static PedidoController of(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<PedidoScope>();
    assert(scope != null, 'Falta PedidoScope alrededor de MaterialApp');
    return scope!.notifier!;
  }
}
