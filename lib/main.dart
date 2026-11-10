
import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'screens/p1_inicio.dart';

void main() {
  runApp(const CartiaApp());
}

class CartiaApp extends StatelessWidget {
  const CartiaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cartia',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: const P1Inicio(),
    );
  }
}
