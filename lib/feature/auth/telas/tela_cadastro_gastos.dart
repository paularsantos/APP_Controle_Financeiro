import 'package:flutter/material.dart';

class FormScreenExpenses extends StatefulWidget {
  const FormScreenExpenses({Key? key}) : super(key: key);

  @override
  State<FormScreenExpenses> createState() => _FormScreenExpensesState();
}

class _FormScreenExpensesState extends State<FormScreenExpenses> {
  TextEditingController nameExpenseController = TextEditingController();

  TextEditingController valueExpenseController = TextEditingController();

  TextEditingController imageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Novo Gasto'),
      ),
      body: Center(
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
                  child: Image.network(
                    imageController.text,
                    errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace){
                      return Image.asset('assets/imgs/no_foto.jpg');
                    },
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    print(nameExpenseController.text);
                    print(int.parse(valueExpenseController.text));
                  },
                  child: Text('Adicionar'))
            ],
          ),
        ),
      ),
    );
  }
}
