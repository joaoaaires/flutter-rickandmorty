import 'package:flutter/material.dart';

class AppTheme {
  static const intPrimary = 0xFF81C141;
  static const colorPrimary = Color(intPrimary);
  static final theme = ThemeData(
    primaryColor: colorPrimary,
    primarySwatch: const MaterialColor(
      intPrimary,
      {
        50: Color(0xFFF0F8E8),
        100: Color(0xFFD9ECC6),
        200: Color(0xFFC0E0A1),
        300: Color(0xFFA7D37C),
        400: Color(0xFF94CA5E),
        500: Color(intPrimary),
        600: Color(0xFF72B139),
        700: Color(0xFF5E9D2F),
        800: Color(0xFF4B8926),
        900: Color(0xFF266714),
      },
    ),
  );
}
