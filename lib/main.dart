import 'package:flutter/material.dart';
import 'providers/pedido_controller.dart';
import 'theme/app_theme.dart';
import 'screens/p1_inicio.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


void main() {
  runApp(const CartiaApp());
}

class CartiaApp extends StatefulWidget {
  const CartiaApp({super.key});

  @override
  State<CartiaApp> createState() => _CartiaAppState();
}

class _CartiaAppState extends State<CartiaApp> {
  final PedidoController _pedido = PedidoController();

  @override
  void dispose() {
    _pedido.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => PedidoScope(
    controller: _pedido,
    child: MaterialApp(
      title: 'Cartia',
      debugShowCheckedModeBanner: false,

      locale: const Locale('es', 'ES'),
      supportedLocales: const [
        Locale('es', 'ES'),
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],

      theme: AppTheme.light,
      home: const P1Inicio(),
    ),
  );
}
