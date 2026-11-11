class Plato {
  final String id;
  final String nombre;
  final String categoria;
  final String descripcion;
  final double precio;
  final List<String> ingredientes;
  final Set<String> alergenosDeclarados;

  const Plato({
    required this.id,
    required this.nombre,
    required this.categoria,
    required this.descripcion,
    required this.precio,
    required this.ingredientes,
    required this.alergenosDeclarados,
  });

  String get precioFormateado => '${precio.toStringAsFixed(2).replaceAll('.', ',')} €';
}
