import 'package:flutter/material.dart';

class JtlcPalette {
  // ignore: constant_identifier_names
  static const int _jtlcPrimary = 0xFF1B4489;
  static const MaterialColor jtlcPrimary = MaterialColor(
    _jtlcPrimary, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color(0xFFE4E9F1),
      100: Color(0xFFBBC7DC),
      200: Color(0xFF8DA2C4),
      300: Color(0xFF5F7CAC),
      400: Color(0xFF3D609B),
      500: Color(_jtlcPrimary),
      600: Color(0xFF183E81),
      700: Color(0xFF143576),
      800: Color(0xFF102D6C),
      900: Color(0xFF081F59),
    },
  );

  static const MaterialColor jtlcAccent = MaterialColor(_jtlcAccentValue, <int, Color>{
    100: Color(0xFF8CA6FF),
    200: Color(_jtlcAccentValue),
    400: Color(0xFF2657FF),
    700: Color(0xFF0D43FF),
  });
  static const int _jtlcAccentValue = 0xFF597FFF;
}
