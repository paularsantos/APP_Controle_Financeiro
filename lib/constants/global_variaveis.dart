import 'package:flutter/material.dart';

class GlobalVariables {
  static const appBarGradient = LinearGradient(
    colors: [
      Color.fromRGBO(227, 212, 10, 1),
      Color.fromARGB(255, 48, 25, 198),
    ],
    stops: [0.5, 1.0],
  );

  static const primaryColor = Color.fromARGB(255, 252, 209, 15);
  static const secondaryColor = Color.fromARGB(255, 48, 25, 198);

  static const backgroundColor = Color.fromARGB(255, 255, 255, 255);
  static const unselectedNavBarColor = Color.fromARGB(221, 220, 12, 12);
  static const Color greybackgroundColor = Color(0xFFDBDBDB);
  static var selectedNavBarColor = Colors.cyan[800];
}
