import 'package:dindin_app/constants/global_variaveis.dart';
import 'package:dindin_app/feature/auth/telas/auth_telas.dart';
import 'package:flutter/material.dart';
import 'package:dindin_app/feature/auth/telas/tela_de_gastos.dart';

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
              const SizedBox(height: 32),
              buildtexto(),
              const SizedBox(height: 32),
              buildLoginButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildImg01() {
    // ignore: prefer_const_declarations
    final urlLogo =
        'https://cdn.pixabay.com/photo/2019/03/20/12/42/money-4068357_1280.png';

    return CircleAvatar(
      backgroundColor: Colors.cyan,
      backgroundImage: NetworkImage(urlLogo),
      radius: 180,
    );
  }

  Widget buildtexto() {
    const texto = Text(
        'O controlaDINDIN é um app desenhado para todos que desejam controlar e pré definir seus gastos de maneira simples.');
    const TextStyle(
      fontStyle: FontStyle.italic,
      color: Colors.black,
      fontWeight: FontWeight.bold,
    );
    return texto;
  }
  // ignore: unused_local_variable

  Widget buildLoginButton(BuildContext context) => ElevatedButton(
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        minimumSize: const Size.fromHeight(50),
        backgroundColor: GlobalVariables.secondaryColor,
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
              builder: (_) => const ExpensesScreen(),//AuthTela()
            ),
          ));
}
