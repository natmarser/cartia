import '../models/plato.dart';

/// Datos de demostración. NO son fichas de alérgenos verificadas.
class Carta {
  static const categorias = <String>[
    'Entrantes', 'Platos principales', 'Postres', 'Bebidas',
  ];

  static const alergenos = <String>[
    'Gluten', 'Leche', 'Huevo', 'Frutos secos', 'Pescado',
    'Crustáceos', 'Soja', 'Apio', 'Mostaza', 'Sésamo',
  ];

  static const platos = <Plato>[
    Plato(id: 'croquetas', nombre: 'Croquetas caseras', categoria: 'Entrantes',
      descripcion: 'Croquetas cremosas con rebozado crujiente.', precio: 8.50,
      ingredientes: ['Leche', 'Harina de trigo', 'Huevo', 'Pan rallado'],
      alergenosDeclarados: {'Gluten', 'Leche', 'Huevo'}),
    Plato(id: 'ensalada', nombre: 'Ensalada de tomate', categoria: 'Entrantes',
      descripcion: 'Tomate fresco con aceite de oliva y orégano.', precio: 6.50,
      ingredientes: ['Tomate', 'Aceite de oliva', 'Orégano'], alergenosDeclarados: {}),
    Plato(id: 'patatas', nombre: 'Patatas bravas', categoria: 'Entrantes',
      descripcion: 'Patatas con salsa brava de la casa.', precio: 7.00,
      ingredientes: ['Patata', 'Tomate', 'Pimentón'], alergenosDeclarados: {}),
    Plato(id: 'hummus', nombre: 'Hummus con verduras', categoria: 'Entrantes',
      descripcion: 'Crema de garbanzos con bastones de verdura.', precio: 7.50,
      ingredientes: ['Garbanzos', 'Tahini', 'Zanahoria', 'Limón'],
      alergenosDeclarados: {'Sésamo'}),
    Plato(id: 'sopa', nombre: 'Sopa de verduras', categoria: 'Entrantes',
      descripcion: 'Sopa casera de verduras de temporada.', precio: 6.00,
      ingredientes: ['Zanahoria', 'Puerro', 'Apio', 'Caldo vegetal'],
      alergenosDeclarados: {'Apio'}),
    Plato(id: 'pollo', nombre: 'Pollo a la plancha', categoria: 'Platos principales',
      descripcion: 'Pechuga a la plancha con guarnición de verduras.', precio: 12.00,
      ingredientes: ['Pollo', 'Calabacín', 'Zanahoria', 'Aceite de oliva'], alergenosDeclarados: {}),
    Plato(id: 'pasta', nombre: 'Pasta con verduras', categoria: 'Platos principales',
      descripcion: 'Pasta salteada con verduras de temporada.', precio: 11.00,
      ingredientes: ['Pasta de trigo', 'Calabacín', 'Cebolla'], alergenosDeclarados: {'Gluten'}),
    Plato(id: 'salmon', nombre: 'Salmón al horno', categoria: 'Platos principales',
      descripcion: 'Salmón con patatas y hierbas aromáticas.', precio: 16.00,
      ingredientes: ['Salmón', 'Patata', 'Perejil'], alergenosDeclarados: {'Pescado'}),
    Plato(id: 'arroz', nombre: 'Arroz con verduras', categoria: 'Platos principales',
      descripcion: 'Arroz salteado con verduras frescas.', precio: 10.50,
      ingredientes: ['Arroz', 'Pimiento', 'Zanahoria', 'Calabacín'], alergenosDeclarados: {}),
    Plato(id: 'hamburguesa', nombre: 'Hamburguesa de la casa', categoria: 'Platos principales',
      descripcion: 'Hamburguesa con queso, pan y guarnición.', precio: 13.50,
      ingredientes: ['Ternera', 'Pan de trigo', 'Queso', 'Lechuga'],
      alergenosDeclarados: {'Gluten', 'Leche'}),
    Plato(id: 'tarta', nombre: 'Tarta de queso', categoria: 'Postres',
      descripcion: 'Tarta de queso horneada, de textura cremosa.', precio: 5.50,
      ingredientes: ['Queso', 'Leche', 'Huevo', 'Azúcar'], alergenosDeclarados: {'Leche', 'Huevo'}),
    Plato(id: 'fruta', nombre: 'Fruta de temporada', categoria: 'Postres',
      descripcion: 'Selección de fruta fresca.', precio: 4.50,
      ingredientes: ['Fruta fresca'], alergenosDeclarados: {}),
    Plato(id: 'helado', nombre: 'Helado de vainilla', categoria: 'Postres',
      descripcion: 'Dos bolas de helado de vainilla.', precio: 4.80,
      ingredientes: ['Leche', 'Nata', 'Azúcar', 'Vainilla'], alergenosDeclarados: {'Leche'}),
    Plato(id: 'brownie', nombre: 'Brownie de chocolate', categoria: 'Postres',
      descripcion: 'Bizcocho de chocolate con nueces.', precio: 5.80,
      ingredientes: ['Harina de trigo', 'Huevo', 'Chocolate', 'Nueces'],
      alergenosDeclarados: {'Gluten', 'Huevo', 'Frutos secos'}),
    Plato(id: 'agua', nombre: 'Agua mineral', categoria: 'Bebidas',
      descripcion: 'Botella de agua mineral.', precio: 2.00,
      ingredientes: ['Agua mineral'], alergenosDeclarados: {}),
    Plato(id: 'zumo', nombre: 'Zumo de naranja', categoria: 'Bebidas',
      descripcion: 'Zumo de naranja natural.', precio: 3.50,
      ingredientes: ['Naranja'], alergenosDeclarados: {}),
    Plato(id: 'cafe', nombre: 'Café solo', categoria: 'Bebidas',
      descripcion: 'Café expreso.', precio: 2.10,
      ingredientes: ['Café', 'Agua'], alergenosDeclarados: {}),
    Plato(id: 'chocolate', nombre: 'Chocolate caliente', categoria: 'Bebidas',
      descripcion: 'Bebida caliente de cacao y leche.', precio: 3.80,
      ingredientes: ['Leche', 'Cacao', 'Azúcar'], alergenosDeclarados: {'Leche'}),
  ];

  static List<Plato> porCategoria(String categoria) =>
      platos.where((p) => p.categoria == categoria).toList();

  static List<Plato> sinAlergenosDeclarados(Set<String> excluidos) =>
      platos.where((p) => p.alergenosDeclarados.intersection(excluidos).isEmpty).toList();

  static List<Plato> buscar(String consulta) {
    final texto = consulta.trim().toLowerCase();
    if (texto.isEmpty) return [];
    return platos.where((p) =>
      p.nombre.toLowerCase().contains(texto) ||
      p.descripcion.toLowerCase().contains(texto) ||
      p.ingredientes.any((i) => i.toLowerCase().contains(texto)),
    ).toList();
  }
}
