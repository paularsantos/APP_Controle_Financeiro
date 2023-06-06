import 'package:flutter/material.dart';
import 'package:dindin_app/common/widgets/gastos.dart';

class ExpensesScreen extends StatefulWidget {
  const ExpensesScreen({Key? key}) : super(key: key);

  @override
  State<ExpensesScreen> createState() => _ExpensesScreenState();
}

class _ExpensesScreenState extends State<ExpensesScreen> {

  bool opacidade = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: const Text('Gastos Mensais'),
      ),
      body: AnimatedOpacity(
        opacity: opacidade ? 1 : 0,
        duration: const Duration(milliseconds: 800),
        child: ListView(
          children: const [
            Expense(
                'Supermercado',
                'assets/imgs/supermercado.jpg',
                3),
            Expense(
                'Farmácia',
                'assets/imgs/farmacia.jpg',
                2),
            Expense(
                'Transporte',
                'assets/imgs/transporte.png',
                5),
            Expense(
                'Lazer',
                'assets/imgs/lazer.png',
                4),
            Expense('Academia',
                'assets/imgs/academia.jpg', 1),
            SizedBox(height: 80,)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            opacidade = !opacidade;
          });
        },
        child: const Icon(Icons.remove_red_eye),
      ),
    );
  }
}
