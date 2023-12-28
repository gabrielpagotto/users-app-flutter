import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

/// Tema escuro da aplicação utilizando a lib `flex_color_scheme`.
ThemeData darkTheme() => FlexThemeData.dark(
      useMaterial3: true,
      scheme: FlexScheme.blueM3,
      darkIsTrueBlack: true,
      swapLegacyOnMaterial3: true,
    );
