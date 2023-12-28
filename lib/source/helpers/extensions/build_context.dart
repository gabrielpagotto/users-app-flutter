import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  /// Criação de extensão para buscar os argumentos de uma rota diretamente
  /// pelo `BuildContext`.
  Object? get arguments => ModalRoute.of(this)?.settings.arguments;
}
