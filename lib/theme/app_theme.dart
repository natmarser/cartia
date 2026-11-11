import 'package:flutter/material.dart';

/// Paleta de Cartia. La decoración no transmite información por sí sola.
class CartiaColors {
  static const fondo = Color(0xFFFBFBF9);
  static const texto = Color(0xFF16251C);
  static const textoSecundario = Color(0xFF34483C);
  static const tarjetas = Colors.white;
  static const bordes = Color(0xFF0B542D);
  static const botonPrincipal = Color(0xFF033D19);
  static const botonSecundario = Color(0xFFE5EEE0);
  static const seleccionado = Color(0xFFE5EEE0);
  static const error = Color(0xFFA33E32);
  static const exito = Color(0xFF245B45);
  static const ondas = Color(0xFFA9C8A0);
}

class AppTheme {
  static ThemeData get light => ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: CartiaColors.fondo,
    colorScheme: const ColorScheme.light(
      primary: CartiaColors.botonPrincipal,
      onPrimary: Colors.white,
      secondary: CartiaColors.botonSecundario,
      onSecondary: CartiaColors.texto,
      surface: CartiaColors.fondo,
      onSurface: CartiaColors.texto,
      outline: CartiaColors.bordes,
      error: CartiaColors.error,
      onError: Colors.white,
    ),
    textTheme: const TextTheme(
      headlineMedium: TextStyle(fontSize: 31, fontWeight: FontWeight.w800,
        color: CartiaColors.botonPrincipal, height: 1.12),
      titleLarge: TextStyle(fontSize: 23, fontWeight: FontWeight.w800,
        color: CartiaColors.texto),
      titleMedium: TextStyle(fontSize: 18, fontWeight: FontWeight.w700,
        color: CartiaColors.texto),
      bodyLarge: TextStyle(fontSize: 16, color: CartiaColors.texto, height: 1.4),
      bodyMedium: TextStyle(fontSize: 15, color: CartiaColors.textoSecundario,
        height: 1.35),
      labelLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
    ),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      scrolledUnderElevation: 0,
      backgroundColor: CartiaColors.fondo,
      foregroundColor: CartiaColors.texto,
      centerTitle: false,
      titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w800,
        color: CartiaColors.texto),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: CartiaColors.botonPrincipal,
        foregroundColor: Colors.white,
        minimumSize: const Size(48, 56),
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: CartiaColors.botonPrincipal,
        backgroundColor: CartiaColors.tarjetas,
        side: const BorderSide(color: CartiaColors.bordes, width: 1.5),
        minimumSize: const Size(48, 56),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      ),
    ),
    checkboxTheme: CheckboxThemeData(
      side: const BorderSide(color: CartiaColors.bordes, width: 2),
      fillColor: WidgetStateProperty.resolveWith((states) =>
        states.contains(WidgetState.selected)
          ? CartiaColors.botonPrincipal : CartiaColors.tarjetas),
      checkColor: const WidgetStatePropertyAll(Colors.white),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: CartiaColors.tarjetas,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: CartiaColors.bordes, width: 1.5),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: CartiaColors.bordes, width: 1.5),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: CartiaColors.botonPrincipal, width: 2),
      ),
    ),
  );
}
