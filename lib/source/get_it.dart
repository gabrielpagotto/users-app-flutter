import 'package:get_it/get_it.dart';
import 'package:users_app/source/repositories/user_repository.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  getIt.registerSingleton<UserRepository>(UserRepository());
}
