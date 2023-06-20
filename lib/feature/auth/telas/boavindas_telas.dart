import 'package:dindin_app/constants/global_variaveis.dart';
import 'package:dindin_app/data/gasto_inherited.dart';
import 'package:dindin_app/feature/auth/telas/auth_telas.dart';
import 'package:dindin_app/feature/auth/telas/tela_cadastro_usuario.dart';
import 'package:flutter/material.dart';
import 'package:dindin_app/feature/auth/telas/tela_de_gastos.dart';

class BoasVindas extends StatefulWidget {
  static const String routeName = '/boasvindas-tela';

  const BoasVindas({Key? key}) : super(key: key); //, required this.welcomeScreenContext

  //final BuildContext welcomeScreenContext;

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
        leadingWidth: 20,
        // ignore: prefer_const_constructors
        leading: Icon(Icons.menu),
      ),
      backgroundColor: GlobalVariables.backgroundColor,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: <Widget>[
              buildImg01(),
              const SizedBox(height: 50),
              buildtexto(),
              const SizedBox(height: 50),
              buildLoginButton(context),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildImg01() {
    // ignore: prefer_const_declarations
    final logo = ("assets/imgs/dindin.jpg");

    return CircleAvatar(
      backgroundColor: Colors.transparent,
      backgroundImage: AssetImage(logo),
      radius: 150,
    );
  }

  Widget buildtexto() {
    const texto = Text(
      'Este é o Controla_DINDIN, um app projetado para todos que desejam controlar seus gastos, podendo definir suas metas de maneira simples.',
      textAlign: TextAlign.justify,
      style: TextStyle(
        fontSize: 18,
        fontStyle: FontStyle.normal,
        color: Colors.blue,
        fontWeight: FontWeight.bold,
      ),
    );
    return texto;
  }
  // ignore: unused_local_variable

  Widget buildLoginButton(BuildContext context) => ElevatedButton(
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        minimumSize: const Size.fromHeight(50),
        backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: const Text(
        'Começar',
        style: TextStyle(fontSize: 24),
      ),
      onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ExpenseInherited(child: FormScreenUser(userContext: context,)),
            ),
          ));
}
