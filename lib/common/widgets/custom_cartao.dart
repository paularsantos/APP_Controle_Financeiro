//import 'package:dindin_app/constants/global_variaveis.dart';
import 'package:dindin_app/constants/global_variaveis.dart';
import 'package:flutter/material.dart';

class CartaoPadrao extends StatelessWidget {
  CartaoPadrao({
    Key? key,
    required this.cor,
  }) : super(key: key);

  Color cor = GlobalVariables.greybackgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20.0),
      decoration:
          BoxDecoration(color: cor, borderRadius: BorderRadius.circular(10.0)),
    );
  }
}
