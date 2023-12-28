import 'dart:convert';

import 'package:http/http.dart' as http;

extension HttpResponseExtension on http.Response {
  /// Criação extensão para decodificar corretamente o body do retorno das requisições.
  dynamic get data => jsonDecode(utf8.decode(bodyBytes));
}
