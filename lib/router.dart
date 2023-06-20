import 'package:dindin_app/feature/auth/telas/auth_telas.dart';
import 'package:dindin_app/feature/auth/telas/boavindas_telas.dart';
import 'package:dindin_app/feature/auth/telas/criar_categorias.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRouter(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case BoasVindas.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (context) => BoasVindas(),
      );

    case AuthTela.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AuthTela(),
      );

    case CriarCategorias.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const CriarCategorias(),
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
