import 'package:dindin_app/data/gasto_inherited.dart';
import 'package:dindin_app/feature/auth/telas/tela_cadastro_gastos.dart';
import 'package:flutter/material.dart';
import 'package:dindin_app/common/widgets/usuarios.dart';

class ExpensesScreen extends StatefulWidget {
  const ExpensesScreen({Key? key, required this.expensesScreenContext}) //, required this.expensesScreenContext
      : super(key: key);

  final BuildContext expensesScreenContext;

  @override
  State<ExpensesScreen> createState() => _ExpensesScreenState();
}

class _ExpensesScreenState extends State<ExpensesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
        ),
        title: const Text('Gastos Mensais'),
      ),
      body: Column(
        children: [
          Container(
            child: ExpenseInherited.of(context).userList[0],
          ),
          Expanded( //permite inserir uma ListView como elemento de uma Column
            child: ListView(
              children: ExpenseInherited.of(context).expenseList,
              padding: EdgeInsets.only(top: 8, bottom: 70),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (contextNew) => FormScreenExpenses(
                        expenseContext: context,
                      ))); //implementação de navegação entre páginas
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

/*
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
* */
