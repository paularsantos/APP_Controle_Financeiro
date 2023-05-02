// ignore_for_file: prefer_const_constructors, duplicate_ignore

import 'package:dindin_app/constants/global_variaveis.dart';

import 'package:dindin_app/feature/auth/telas/boavindas_telas.dart';
import 'package:dindin_app/router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Controla DinDin',
      theme: ThemeData(
        scaffoldBackgroundColor: GlobalVariables.backgroundColor,
        colorScheme: const ColorScheme.light(
          primary: GlobalVariables.secondaryColor,
        ),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          iconTheme: IconThemeData(
            color: Color.fromARGB(221, 220, 12, 12),
          ),
        ),
      ),
      onGenerateRoute: (settings) => generateRouter(settings),
      home: const BoasVindas(),
    );
  }
}
