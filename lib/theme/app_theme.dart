import 'package:flutter/material.dart';

// Colores acordados por el equipo para Cartia.
class CartiaColors {
  static const fondo = Color(0xFFFBFBF9);
  static const texto = Color(0xFF16251C);
  static const textoSecundario = Color(0xFF34483C);
  static const tarjetas = Color(0xFFFFFFFF);
  static const bordes = Color(0xFF0B542D);
  static const botonPrincipal = Color(0xFF033D19);
  static const botonSecundario = Color(0xFFE5EEE0);
  static const seleccionado = Color(0xFFE5EEE0);
  static const error = Color(0xFFA33E32);
  static const exito = Color(0xFF245B45);
}

class AppTheme {
  static ThemeData get light => ThemeData(
    useMaterial3: true,
    // En Android Arial puede no estar instalada y se usará una alternativa.
    fontFamily: 'Arial',
    scaffoldBackgroundColor: CartiaColors.fondo,
    colorScheme: const ColorScheme.light(
      primary: CartiaColors.botonPrincipal,
      onPrimary: Colors.white,
      secondary: CartiaColors.botonSecundario,
      onSecondary: CartiaColors.texto,
      surface: CartiaColors.fondo,
      onSurface: CartiaColors.texto,
      error: CartiaColors.error,
      onError: Colors.white,
      outline: CartiaColors.bordes,
    ),
    textTheme: const TextTheme(
      headlineMedium: TextStyle(
        fontSize: 28, fontWeight: FontWeight.w800, color: CartiaColors.texto),
      titleLarge: TextStyle(
        fontSize: 23, fontWeight: FontWeight.w800, color: CartiaColors.texto),
      titleMedium: TextStyle(
        fontSize: 16, fontWeight: FontWeight.w700, color: CartiaColors.texto),
      bodyLarge: TextStyle(fontSize: 16, color: CartiaColors.texto),
      bodyMedium: TextStyle(fontSize: 14, color: CartiaColors.textoSecundario),
      bodySmall: TextStyle(fontSize: 12, color: CartiaColors.textoSecundario),
      labelLarge: TextStyle(
        fontSize: 16, fontWeight: FontWeight.w700),
    ),
    appBarTheme: const AppBarThemeData(
      backgroundColor: CartiaColors.fondo,
      foregroundColor: CartiaColors.texto,
      surfaceTintColor: CartiaColors.fondo,
      elevation: 0,
      centerTitle: false,
      titleTextStyle: TextStyle(
        fontFamily: 'Arial', fontSize: 23,
        fontWeight: FontWeight.w800, color: CartiaColors.texto),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: CartiaColors.botonPrincipal,
        foregroundColor: Colors.white,
        minimumSize: const Size(48, 48),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        backgroundColor: CartiaColors.botonSecundario,
        foregroundColor: CartiaColors.texto,
        minimumSize: const Size(48, 48),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        side: const BorderSide(color: CartiaColors.bordes),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
      ),
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: WidgetStateProperty.resolveWith<Color?>((states) {
        if (states.contains(WidgetState.selected)) {
          return CartiaColors.botonPrincipal;
        }
        return CartiaColors.tarjetas;
      }),
      checkColor: const WidgetStatePropertyAll<Color>(Colors.white),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(9)),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: CartiaColors.bordes, width: 2),
        borderRadius: BorderRadius.circular(9),
      ),
    ),
  );
}
