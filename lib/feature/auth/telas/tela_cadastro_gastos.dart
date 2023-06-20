import 'package:dindin_app/data/gasto_inherited.dart';
import 'package:flutter/material.dart';

class FormScreenExpenses extends StatefulWidget {
  const FormScreenExpenses({Key? key, required this.expenseContext})
      : super(key: key);

  final BuildContext expenseContext;

  @override
  State<FormScreenExpenses> createState() => _FormScreenExpensesState();
}

class _FormScreenExpensesState extends State<FormScreenExpenses> {
  TextEditingController nameExpenseController = TextEditingController();

  TextEditingController valueExpenseController = TextEditingController();

  TextEditingController imageController = TextEditingController();

  TextEditingController priorityController = TextEditingController();

  final _formKey = GlobalKey<FormState>(); //chave para as validações

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey, //chave para as validações
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Novo Gasto'),
        ),
        body: Center(
          child: SingleChildScrollView(
            //widget que faz com que o tecldo não reajuste ao tamanho da tela, evita overflow da tela
            child: Container(
              height: 650,
              width: 375,
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 3),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (String? value) {
                        //implementação de validação do formulário
                        if (value != null && value.isEmpty) {
                          return 'Insira o nome do gasto';
                        }
                        return null;
                      },
                      controller: nameExpenseController,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Nome do Gasto',
                        fillColor: Colors.white70,
                        filled: true,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (String? value) {
                        if (value != null && value.isEmpty) {
                          return 'Insira a prioridade do gasto (1 a 5)';
                        }
                        return null;
                      },
                      controller: priorityController,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'prioridade do gasto (1 a 5)',
                        fillColor: Colors.white70,
                        filled: true,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty ||
                            int.parse(value) > 1000000 ||
                            int.parse(value) < 0) {
                          return 'Insira um valor > 0';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      controller: valueExpenseController,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Valor a Reservar',
                        fillColor: Colors.white70,
                        filled: true,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      onChanged: (text) {
                        setState(() {});
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Insira um URL de imagem';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.url,
                      controller: imageController,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Imagem',
                        fillColor: Colors.white70,
                        filled: true,
                      ),
                    ),
                  ),
                  Container(
                    height: 100,
                    width: 72,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 2, color: Colors.blue),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        imageController.text,
                        errorBuilder: (BuildContext context, Object exception,
                            StackTrace? stackTrace) {
                          return Image.asset('assets/imgs/no_foto.jpg');
                        },
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          //implementamndo a validação do formulário no botão
                          ExpenseInherited.of(widget.expenseContext).newExpense(
                              nameExpenseController.text,
                              imageController.text,
                              double.parse(valueExpenseController.text),
                              int.parse(priorityController.text));

                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Salvando novo gasto')));
                          Navigator.pop(
                              context); //implementação de retorno de página após cadastro de gasto
                        }
                      },
                      child: Text('Adicionar'))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
