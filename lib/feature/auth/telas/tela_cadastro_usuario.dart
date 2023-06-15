import 'package:dindin_app/data/gasto_inherited.dart';
import 'package:dindin_app/feature/auth/telas/tela_de_gastos.dart';
import 'package:flutter/material.dart';

class FormScreenUser extends StatefulWidget {
  const FormScreenUser({Key? key, required this.userContext})
      : super(key: key);

  final BuildContext userContext;

  @override
  State<FormScreenUser> createState() => _FormScreenUserState();
}

class _FormScreenUserState extends State<FormScreenUser> {

  TextEditingController nameUserController = TextEditingController();

  TextEditingController emailUserController = TextEditingController();

  TextEditingController incomeUserController = TextEditingController();

  TextEditingController imageController = TextEditingController();

  final _formKey = GlobalKey<FormState>(); //chave para as validações

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey, //chave para as validações
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Novo Usuario'),
        ),
        body: Center(
          child: SingleChildScrollView(
            //widget que faz com que o teclado não reajuste ao tamanho da tela, evita overflow da tela
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
                          return 'Insira o nome do usuario';
                        }
                        return null;
                      },
                      controller: nameUserController,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Nome do Usuario',
                        fillColor: Colors.white70,
                        filled: true,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (String? value) {
                        //implementação de validação do formulário
                        if (value != null && value.isEmpty) {
                          return 'Insira o e-mail do usuario';
                        }
                        return null;
                      },
                      controller: emailUserController,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'e-mail',
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
                      controller: incomeUserController,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Renda mensal',
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
                          // print(nameExpenseController.text);
                          // print(int.parse(valueExpenseController.text));

                          ExpenseInherited.of(widget.userContext).newUser(
                              nameUserController.text, emailUserController.text,
                              double.parse(incomeUserController.text), imageController.text);

                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Salvando novo usuario')));
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (contextNew) => ExpensesScreen(expensesScreenContext: context))); //implementação de retorno de página após cadastro de gasto
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