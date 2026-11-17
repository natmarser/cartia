import 'package:flutter/material.dart';
import '../models/plato.dart';
import '../theme/app_theme.dart';
import '../screens/p3_detalle.dart';

/// Cabecera con el logotipo del prototipo original.
class CartiaHeader extends StatelessWidget implements PreferredSizeWidget {
  final bool inicio;
  final bool excludeHeaderSemantics;
  const CartiaHeader({super.key, this.inicio = false, this.excludeHeaderSemantics = false});

  @override
  Size get preferredSize => const Size.fromHeight(68);

  @override
  Widget build(BuildContext context) => AppBar(
    excludeHeaderSemantics: excludeHeaderSemantics,
    automaticallyImplyLeading: false,
    leading: inicio ? null : IconButton(
      tooltip: 'Volver a la pantalla anterior',
      icon: const Icon(Icons.arrow_back),
      onPressed: () { Navigator.maybePop(context); },
    ),
    toolbarHeight: 68,
    titleSpacing: inicio ? 20 : 0,
    title: Row(children: [
      Image.asset('assets/images/logo_cartia.png', width: 125,
        height: 57, fit: BoxFit.contain, semanticLabel: 'Cartia',
        errorBuilder: (_, _, _) => const Text('CARTIA')),
      const Spacer(),
      const Text('Carta digital', style: TextStyle(
        fontSize: 14, fontWeight: FontWeight.w500,
        color: CartiaColors.texto)),
      const SizedBox(width: 4),
    ]),
    bottom: const PreferredSize(preferredSize: Size.fromHeight(1),
      child: Divider(height: 1, thickness: 1, color: Color(0xFFD8E1D7))),
  );
}

/// Ondas verdes decorativas: nunca afectan a la lectura de los textos.
class FondoOndas extends StatelessWidget {
  final Widget child;
  const FondoOndas({super.key, required this.child});

  @override
  Widget build(BuildContext context) => Stack(children: [
    Positioned.fill(child: IgnorePointer(child: CustomPaint(
      painter: _OndasPainter(),
    ))),
    child,
  ]);
}

class _OndasPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final p1 = Path()
      ..moveTo(size.width * .30, 0)
      ..cubicTo(size.width * .67, 10, size.width * .73, size.height * .13,
        size.width, size.height * .03)
      ..lineTo(size.width, 0)..close();
    canvas.drawPath(p1, Paint()..color = const Color(0xFFEDF3EA));
    final p2 = Path()
      ..moveTo(size.width * .42, 0)
      ..cubicTo(size.width * .67, size.height * .02,
        size.width * .82, size.height * .17,
        size.width, size.height * .07)
      ..lineTo(size.width, 0)..close();
    canvas.drawPath(p2, Paint()..color = const Color(0xFFDDEADA));
    final p3 = Path()
      ..moveTo(size.width * .72, 0)
      ..cubicTo(size.width * .82, size.height * .04,
        size.width * .90, size.height * .10, size.width, size.height * .06)
      ..lineTo(size.width, 0)..close();
    canvas.drawPath(p3, Paint()..color = const Color(0xFFC6DEC0));
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class TituloSeccion extends StatelessWidget {
  final String texto;
  const TituloSeccion(this.texto, {super.key});

  @override
  Widget build(BuildContext context) => Semantics(
    header: true,
    child: Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(texto, style: Theme.of(context).textTheme.titleLarge),
    ),
  );
}

class AvisoAlergenos extends StatelessWidget {
  final bool compacto;
  const AvisoAlergenos({super.key, this.compacto = false});

  @override
  Widget build(BuildContext context) => Semantics(
    container: true,
    child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Icon(Icons.info_outline, size: 24, color: CartiaColors.botonPrincipal),
      const SizedBox(width: 10),
      Expanded(child: Text(compacto
        ? 'Consulta con el restaurante la información sobre alérgenos.'
        : 'Carta ficticia: los filtros solo comprueban los alérgenos declarados. No garantizan la ausencia de alérgenos ni de trazas. Confirma ingredientes y preparación con el restaurante.',
        style: const TextStyle(color: CartiaColors.texto, fontSize: 14,
          height: 1.4))),
    ]),
  );
}

class TarjetaPlato extends StatelessWidget {
  final Plato plato;
  const TarjetaPlato({super.key, required this.plato});

  @override
  Widget build(BuildContext context) {
    void abrirDetalle() => Navigator.push(context,
      MaterialPageRoute(builder: (_) => P3Detalle(plato: plato)));

    return Semantics(
      button: true,
      label: '${plato.nombre}. ${plato.descripcion}. Precio ${plato.precioFormateado}',
      hint: 'Abrir detalles del plato',
      onTap: abrirDetalle,
      excludeSemantics: true,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Material(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
            side: const BorderSide(color: CartiaColors.bordes, width: 1.4)),
          child: InkWell(
            borderRadius: BorderRadius.circular(18),
            onTap: abrirDetalle,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
              child: Row(children: [
                Container(width: 48, height: 48,
                  decoration: BoxDecoration(color: CartiaColors.botonSecundario,
                    borderRadius: BorderRadius.circular(12)),
                  child: const Icon(Icons.restaurant_menu,
                    color: CartiaColors.botonPrincipal)),
                const SizedBox(width: 12),
                Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(plato.nombre, style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(height: 4),
                    Text(plato.descripcion, maxLines: 2, overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyMedium),
                    const SizedBox(height: 6),
                    Text(plato.precioFormateado, style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w800,
                      color: CartiaColors.botonPrincipal)),
                  ])),
                const SizedBox(width: 8),
                const Icon(Icons.chevron_right, size: 30,
                  color: CartiaColors.botonPrincipal),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}

/// Acción principal de ancho completo en pantallas secundarias.
class CartiaBoton extends StatelessWidget {
  final String texto;
  final IconData icono;
  final VoidCallback? onPressed;
  final bool secundario;
  const CartiaBoton({super.key, required this.texto, required this.icono,
    this.onPressed, this.secundario = false});

  @override
  Widget build(BuildContext context) => SizedBox(
    width: double.infinity, height: 60,
    child: secundario
      ? OutlinedButton.icon(onPressed: onPressed, icon: Icon(icono), label: Text(texto))
      : ElevatedButton.icon(onPressed: onPressed, icon: Icon(icono), label: Text(texto)),
  );
}
