import 'package:dindin_app/feature/auth/telas/auth_telas.dart';
import 'package:dindin_app/feature/auth/telas/boavindas_telas.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRouter(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case BoasVindas.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const BoasVindas(),
      );

    case AuthTela.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AuthTela(),
      );

    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Scaffold(
          body: Center(
            child: Text('Esta URL não existe'),
          ),
        ),
      );
  }
}
