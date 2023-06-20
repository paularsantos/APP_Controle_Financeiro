import 'package:dindin_app/data/gasto_inherited.dart';
import 'package:dindin_app/feature/auth/telas/tela_cadastro_gastos.dart';
import 'package:flutter/material.dart';
import 'package:dindin_app/common/widgets/usuarios.dart';

class ExpensesScreen extends StatefulWidget {
  ExpensesScreen(
      {Key? key,
      required this.expensesScreenContext})
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
        leading: Container(),
        title: const Text('Gastos Mensais'),
      ),
      body: Column(
        children: [
          Container(
            child:
                ExpenseInherited.of(widget.expensesScreenContext).userList[0],
          ),
          Expanded(
            //permite inserir uma ListView como elemento de uma Column
            child: ListView(
              children:
                  ExpenseInherited.of(widget.expensesScreenContext).expenseList,
              padding: EdgeInsets.only(top: 8, bottom: 70),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              widget.expensesScreenContext,
              MaterialPageRoute(
                  builder: (contextNew) => FormScreenExpenses(
                        expenseContext: widget.expensesScreenContext,
                      ))); //implementação de navegação entre páginas
          for (int i = 0;
              i <
                  ExpenseInherited.of(widget.expensesScreenContext)
                      .expenseList
                      .length;
              i++) {
            print(ExpenseInherited.of(widget.expensesScreenContext)
                .expenseList[i]
                .nome);
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
