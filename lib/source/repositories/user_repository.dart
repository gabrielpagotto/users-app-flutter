import 'package:users_app/source/exception/repository_exception.dart';
import 'package:users_app/source/helpers/extensions/http.dart';
import 'package:users_app/source/helpers/mixins/json_placeholder_api_mixin.dart';
import 'package:users_app/source/models/user.dart';

class UserRepository with JsonPlaceholderApiMixin {
  Future<List<User>> getAll() async {
    var response = await jsonPlaceholderApi.get('users');
    if (response.statusCode != 200) {
      throw const RepositoryException('Não foi possível listar os usuários.');
    }
    return response.data.map<User>((e) => User.fromMap(e)).toList();
  }

  Future<User> findById(int id) async {
    var response = await jsonPlaceholderApi.get('users/$id');
    if (response.statusCode == 404) {
      throw const RepositoryException('Usuário não encontrado.');
    }
    if (response.statusCode != 200) {
      throw const RepositoryException('Não foi possível buscar o usuário.');
    }
    return User.fromMap(response.data);
  }
}
