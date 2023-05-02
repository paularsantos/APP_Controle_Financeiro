import 'package:dindin_app/constants/global_variaveis.dart';
import 'package:dindin_app/feature/auth/telas/auth_telas.dart';
import 'package:flutter/material.dart';

class BoasVindas extends StatefulWidget {
  static const String routeName = '/boasvindas-tela';
  const BoasVindas({Key? key}) : super(key: key);

  @override
  State<BoasVindas> createState() => _BoasVindasState();
}

class _BoasVindasState extends State<BoasVindas> {
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
      backgroundColor: GlobalVariables.backgroundColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Image.asset('assets/imgs/gestao.jpg'),
              const Text(
                'O controlaDINDIN é um app desenhado para todos que desejam controlar e pré definir seus gastos de maneira simples.',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
              ElevatedButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const AuthTela(),
                  ),
                ),
                child: const Text('Comerçar'),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(MediaQuery.of(context).size.width, 52),
                  textStyle: const TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
