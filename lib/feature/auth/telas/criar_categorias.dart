import 'package:dindin_app/common/widgets/custom_cartao.dart';
import 'package:flutter/material.dart';

class CriarCategorias extends StatefulWidget {
  static const String routeName = '/criar-categorias';
  const CriarCategorias({
    Key? key,
  }) : super(key: key);

  @override
  State<CriarCategorias> createState() => _CriarCategoriasState();
}

class _CriarCategoriasState extends State<CriarCategorias> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Controla DINDIN'),
        centerTitle: false,
        automaticallyImplyLeading: false,
        leadingWidth: 30,
        // ignore: prefer_const_constructors
        leading: Icon(Icons.menu),
      ),
      body: Column(children: [
        Expanded(
            child: Row(
          children: [
            Expanded(
              child: CartaoPadrao(
                cor: Colors.blueGrey.shade300,
              ),
            ),
            Expanded(
                child: CartaoPadrao(
              cor: const Color(0xFF9E9E9E),
            )),
          ],
        )),
        Expanded(
            child: Row(children: [
          Expanded(
              child: CartaoPadrao(
            cor: Color(0xFF9E9E9E),
          )),
          Expanded(
            child: CartaoPadrao(
              cor: Color(0xFF9E9E9E),
            ),
          )
        ])),
        Expanded(
          child: Row(
            children: [
              Expanded(
                  child: CartaoPadrao(
                cor: Color(0xFF9E9E9E),
              )),
              Expanded(
                child: CartaoPadrao(cor: Color(0xFF9E9E9E)),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
