import 'package:dindin_app/common/widgets/gastos.dart';
import 'package:flutter/material.dart';

import '../common/widgets/usuarios.dart';

class ExpenseInherited extends InheritedWidget {
  ExpenseInherited({
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  final List<Expense> expenseList = [
    Expense('Supermercado', 'assets/imgs/supermercado.jpg', 500, 3),
    Expense('Farmácia', 'assets/imgs/farmacia.jpg', 300, 2),
  ];

  final List<User> userList =
      []; //User('André', 'andre@hotmail', 10000, 'assets/imgs/caveira.png'), User('Feitosa', 'andre@hotmail', 20000, 'assets/imgs/caveira.png')

  void newExpense(String name, String image, double value, int priority) {
    expenseList.add(Expense(name, image, value, priority));
  }

  void newUser(String name, String email, double income, String photo) {
    userList.add(User(name, email, income, photo));
  }

  static ExpenseInherited of(BuildContext context) {
    final ExpenseInherited? result =
        context.dependOnInheritedWidgetOfExactType<ExpenseInherited>();
    assert(result != null, 'No ExpenseInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(ExpenseInherited oldWidget) {
    return oldWidget.expenseList.length != expenseList.length;
  }
}
