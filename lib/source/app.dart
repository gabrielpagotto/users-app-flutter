import 'package:flutter/material.dart';
import 'package:users_app/source/app_routes.dart';
import 'package:users_app/source/themes/dark_theme.dart';
import 'package:users_app/source/themes/light_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Usuários App',
      theme: lightTheme(),
      darkTheme: darkTheme(),
      themeMode: ThemeMode.system,
      initialRoute: AppRoutes.initialRoute,
      routes: AppRoutes.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
