import 'package:flutter/material.dart';

class Palette {
  // ignore: Dark
  static const MaterialColor jpopsDarkPrimary = MaterialColor(_jpopsDarkPrimaryValue, <int, Color>{
    50: Color(0xFFE5E9EC),
    100: Color(0xFFBFC9D0),
    200: Color(0xFF94A5B1),
    300: Color(0xFF698192),
    400: Color(0xFF48667A),
    500: Color(_jpopsDarkPrimaryValue),
    600: Color(0xFF24445B),
    700: Color(0xFF1E3B51),
    800: Color(0xFF183347),
    900: Color(0xFF0F2335),
  });
  static const int _jpopsDarkPrimaryValue = 0xFF284B63;

  static const MaterialColor mcgpalette3Accent = MaterialColor(_mcgpalette3AccentValue, <int, Color>{
    100: Color(0xFF72B8FF),
    200: Color(_mcgpalette3AccentValue),
    400: Color(0xFF0C85FF),
    700: Color(0xFF0079F1),
  });
  static const int _mcgpalette3AccentValue = 0xFF3F9FFF;

  // ignore: constant_identifier_names
  static const MaterialColor jpopsPrimary = MaterialColor(
    _jpopsPrimary, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color(0xFFFFEDE0),
      100: Color(0xFFFFD1B3),
      200: Color(0xFFFFB380),
      300: Color(0xFFFF944D),
      400: Color(0xFFFF7D26),
      500: Color(_jpopsPrimary),
      600: Color(0xFFFF5E00),
      700: Color(0xFFFF5300),
      800: Color(0xFFFF4900),
      900: Color(0xFFFF3800),
    },
  );
  static const int _jpopsPrimary = 0xFFFF6600;

  static const MaterialColor sm4shAccent = MaterialColor(_jpopsAccentValue, <int, Color>{
    100: Color(0xFF8CA6FF),
    200: Color(_jpopsAccentValue),
    400: Color(0xFF2657FF),
    700: Color(0xFF0D43FF),
  });
  static const int _jpopsAccentValue = 0xFF597FFF;
}
