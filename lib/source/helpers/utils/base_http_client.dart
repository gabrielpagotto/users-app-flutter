import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

/// Optei por criar um configurador para o `http` para que seja possível setar
/// configurações padrões em suas subclasses.
/// Implementei somente o método `get` pois é o único utilizado dentro do desafio.
abstract class HttpConfigurator {
  @protected
  String get authority;

  Uri _createURI(String path, Map<String, dynamic>? queryParameters) => Uri.https(authority, path, queryParameters);

  Future<http.Response> get(String path, {Map<String, dynamic>? queryParameters, Map<String, String>? headers}) {
    return http.get(_createURI(path, queryParameters), headers: headers);
  }

  Future<http.Response> post(String path) {
    throw UnimplementedError();
  }

  Future<http.Response> put(String path) {
    throw UnimplementedError();
  }

  Future<http.Response> delete(String path) {
    throw UnimplementedError();
  }
}
