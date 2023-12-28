import 'package:flutter/material.dart';
import 'package:users_app/source/helpers/extensions/build_context.dart';
import 'package:users_app/source/modules/user_details/user_details_view.dart';
import 'package:users_app/source/modules/users/users_view.dart';

/// Optei por criar uma configuração personalizada para rotas, porém
/// seria possível criar também o roteamento utilizando alguma
/// lib como o `go_router`.
class AppRoutes {
  static const initialRoute = UsersView.route;

  static final routes = <String, WidgetBuilder>{
    UsersView.route: (context) => const UsersView(),
    UserDetailsView.route: (context) => UserDetailsView(userId: context.arguments as int),
  };
}
