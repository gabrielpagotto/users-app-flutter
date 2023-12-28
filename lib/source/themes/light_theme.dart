import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

/// Tema claro da aplicação utilizando a lib `flex_color_scheme`.
ThemeData lightTheme() => FlexThemeData.light(
      useMaterial3: true,
      scheme: FlexScheme.aquaBlue,
      lightIsWhite: true,
      swapLegacyOnMaterial3: true,
    );
