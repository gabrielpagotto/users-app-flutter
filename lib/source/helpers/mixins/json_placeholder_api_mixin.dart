import 'package:meta/meta.dart';
import 'package:users_app/source/helpers/utils/base_http_client.dart';

/// Está é a classe já configurada para realizar chamadas
/// diretamente na api `https://jsonplaceholder.typicode.com`.
class JsonPlaceholderApi extends HttpConfigurator {
  JsonPlaceholderApi();

  @override
  String get authority => 'jsonplaceholder.typicode.com';
}

mixin JsonPlaceholderApiMixin {
  @protected
  JsonPlaceholderApi get jsonPlaceholderApi => JsonPlaceholderApi();
}
