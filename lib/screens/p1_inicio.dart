import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/cartia_widgets.dart';
import 'p2_categoria.dart';
import 'p4_filtros.dart';
import 'p6_busqueda.dart';
import 'p7_pedido.dart';
import '../providers/pedido_controller.dart';

class P1Inicio extends StatelessWidget {
  const P1Inicio({super.key});

  static const _categorias = [
    _CategoriaVisual('Entrantes', 'Croquetas, ensaladas y sopas',
      'entrantes', Icons.soup_kitchen_outlined),
    _CategoriaVisual('Platos principales', 'Carnes, pescados y pastas',
      'principales', Icons.dinner_dining_outlined),
    _CategoriaVisual('Postres', 'Tartas, helados y dulces',
      'postres', Icons.cake_outlined),
    _CategoriaVisual('Bebidas', 'Aguas, refrescos y zumos',
      'bebidas', Icons.local_drink_outlined),
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: const CartiaHeader(inicio: true),
    body: FondoOndas(child: ListView(
      padding: const EdgeInsets.fromLTRB(24, 18, 24, 36),
      children: [
        const Text('CARTA DEL RESTAURANTE', style: TextStyle(
          color: CartiaColors.botonPrincipal,
          fontSize: 12, fontWeight: FontWeight.w800, letterSpacing: .4)),
        const SizedBox(height: 10),
        Text('Nuestra carta', style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: 14),
        const Text('Explora nuestras categorías y\nconsulta la información de\ncada plato.',
          style: TextStyle(fontSize: 16, color: CartiaColors.texto, height: 1.4)),
        const SizedBox(height: 22),
        const TituloSeccion('Categorías'),
        for (final categoria in _categorias) ...[
          _TarjetaCategoria(categoria: categoria,
            onTap: () => Navigator.push(context, MaterialPageRoute(
              builder: (_) => P2Categoria(categoria: categoria.nombre)))),
          const SizedBox(height: 10),
        ],
        const SizedBox(height: 16),
        const Divider(height: 1, color: Color(0xFFCDD8CB)),
        const SizedBox(height: 20),
        const TituloSeccion('Otras opciones'),
        LayoutBuilder(builder: (context, constraints) {
          final estrecho = constraints.maxWidth < 345 ||
              MediaQuery.textScalerOf(context).scale(16) > 22;
          final buscar = _BotonInicio('Buscar', Icons.search,
            () => Navigator.push(context, MaterialPageRoute(
              builder: (_) => const P6Busqueda())));
          final filtros = _BotonInicio('Filtros de alérgenos', Icons.tune,
            () => Navigator.push(context, MaterialPageRoute(
              builder: (_) => const P4Filtros())));
          return estrecho
            ? Column(children: [buscar, const SizedBox(height: 12), filtros])
            : Row(children: [Expanded(child: buscar),
                const SizedBox(width: 10), Expanded(child: filtros)]);
        }),
        const SizedBox(height: 12),
        Builder(builder: (context) {
          final pedido = PedidoScope.of(context);
          return _BotonInicio(
            pedido.unidades == 0 ? 'Mi pedido' : 'Mi pedido (${pedido.unidades})',
            Icons.shopping_basket_outlined,
            () => Navigator.push(context,
              MaterialPageRoute(builder: (_) => const P7Pedido())),
          );
        }),
        const SizedBox(height: 18),
        const AvisoAlergenos(compacto: true),
      ],
    )),
  );
}

class _CategoriaVisual {
  final String nombre;
  final String descripcion;
  final String imagen;
  final IconData icono;
  const _CategoriaVisual(this.nombre, this.descripcion, this.imagen, this.icono);
}

class _TarjetaCategoria extends StatelessWidget {
  final _CategoriaVisual categoria;
  final VoidCallback onTap;
  const _TarjetaCategoria({required this.categoria, required this.onTap});

  @override
  Widget build(BuildContext context) => Material(
    color: Colors.white,
    shape: RoundedRectangleBorder(
      side: const BorderSide(color: CartiaColors.bordes, width: 1.5),
      borderRadius: BorderRadius.circular(16)),
    clipBehavior: Clip.antiAlias,
    child: InkWell(
      onTap: onTap,
      child: ConstrainedBox(
        constraints: const BoxConstraints(minHeight: 98),
        child: Stack(children: [
          Positioned.fill(child: Align(alignment: Alignment.centerRight,
            child: FractionallySizedBox(widthFactor: .53,
              child: Image.asset('assets/images/${categoria.imagen}.jpg',
                fit: BoxFit.cover,
                errorBuilder: (_, _, _) => const SizedBox.shrink())))),
          Positioned.fill(child: DecoratedBox(decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.white, Colors.white,
              Colors.white.withValues(alpha: .96),
              Colors.white.withValues(alpha: .18),
            ], stops: const [0, .45, .67, 1]),
          ))),
          Padding(padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            child: Row(children: [
              Container(width: 54, height: 58,
                decoration: BoxDecoration(
                  color: CartiaColors.botonSecundario,
                  borderRadius: BorderRadius.circular(13)),
                child: Icon(categoria.icono, size: 32,
                  color: CartiaColors.botonPrincipal)),
              const SizedBox(width: 10),
              Container(height: 42, width: 1.5, color: CartiaColors.bordes),
              const SizedBox(width: 10),
              Expanded(child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(categoria.nombre, style: const TextStyle(
                    color: Color(0xFF111A14), fontSize: 17,
                    fontWeight: FontWeight.w800)),
                  const SizedBox(height: 3),
                  Text(categoria.descripcion, style: const TextStyle(
                    color: CartiaColors.texto, fontSize: 12.5,
                    fontWeight: FontWeight.w500)),
                ])),
              const SizedBox(width: 8),
              Container(width: 44, height: 48,
                decoration: const BoxDecoration(color: CartiaColors.botonPrincipal,
                  shape: BoxShape.circle),
                child: const Icon(Icons.chevron_right, color: Colors.white, size: 28)),
            ]),
          ),
        ]),
      ),
    ),
  );
}

class _BotonInicio extends StatelessWidget {
  final String texto;
  final IconData icono;
  final VoidCallback onTap;
  const _BotonInicio(this.texto, this.icono, this.onTap);

  @override
  Widget build(BuildContext context) => Material(
    color: CartiaColors.botonPrincipal,
    borderRadius: BorderRadius.circular(16),
    clipBehavior: Clip.antiAlias,
    elevation: 2,
    child: InkWell(onTap: onTap,
      child: ConstrainedBox(constraints: const BoxConstraints(minHeight: 98),
        child: Padding(padding: const EdgeInsets.all(10),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Icon(icono, size: 31, color: Colors.white),
            const SizedBox(height: 5),
            Text(texto, textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white,
                fontSize: 15, fontWeight: FontWeight.w800)),
          ]))),
    ),
  );
}
