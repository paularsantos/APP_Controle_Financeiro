import 'package:flutter/material.dart';
import 'package:dindin_app/common/widgets/prioridade_do_gasto.dart';

class Expense extends StatefulWidget {
  final String nome;

  final String foto;

  double valor;

  final int prioridade;

  Expense(this.nome, this.foto, this.valor, this.prioridade, {Key? key})
      : super(key: key);

  @override
  State<Expense> createState() => _ExpenseState();
}

class _ExpenseState extends State<Expense> {
  TextEditingController valuePaymentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    int nivel = 0;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black12),
                borderRadius: BorderRadius.circular(4),
                color: Colors.blue),
            height: 240,
          ),
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12),
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.white),
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: Colors.black26),
                        width: 72,
                        height: 100,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: Image.asset(widget.foto, fit: BoxFit.cover),
                        )),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                            width: 200,
                            child: Text(
                              widget.nome,
                              style: const TextStyle(
                                fontSize: 24,
                                overflow: TextOverflow.ellipsis,
                              ),
                            )),
                        Priority(
                          priorityLevel: widget.prioridade,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 70,
                      width: 70,
                      child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              widget.valor = widget.valor -
                                  double.parse(valuePaymentController.text);
                            });
                            //print(nivel);
                          },
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Icon(Icons.add),
                              Text(
                                'R\$',
                                style: TextStyle(fontSize: 12),
                              )
                            ],
                          )),
                    ),
                  ],
                ),
              ),
              Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (String? value) {
                        //implementação de validação do formulário
                        if (value != null && value.isEmpty) {
                          return 'Informe o pagamento';
                        }
                        return null;
                      },
                      controller: valuePaymentController,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Informe um Pagamento',
                        fillColor: Colors.white70,
                        filled: true,
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      child: LinearProgressIndicator(
                        color: Colors.white,
                        value: (widget.valor > 0) ? widget.valor : 1,
                      ),
                      width: 200,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text('Saldo: ${widget.valor}',
                        style:
                            const TextStyle(color: Colors.white, fontSize: 16)),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
