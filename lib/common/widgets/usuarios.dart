import 'package:flutter/material.dart';
import 'package:dindin_app/common/widgets/prioridade_do_gasto.dart';

class User extends StatefulWidget {

  final String name;

  final String email;

  final double income;

  final String photo;

  const User(this.name, this.email, this.income, this.photo, {Key? key}) : super(key: key);

  @override
  State<User> createState() => _UserState();
}

class _UserState extends State<User> {
  @override
  Widget build(BuildContext context) {
    int nivel = 0;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4), color: Colors.blue.shade200),
            height: 140,
          ),
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.blue.shade100),
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
                          child:
                          Image.asset(widget.photo, fit: BoxFit.cover),
                        )),
                    SizedBox(
                        width: 200,
                        child: Text(
                          widget.name,
                          style: const TextStyle(
                            fontSize: 24,
                            overflow: TextOverflow
                                .ellipsis,
                          ),
                        )),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: SizedBox(
                      child: LinearProgressIndicator(
                        color: Colors.white,
                        value: (widget.income > 0)
                            ? (widget.income)
                            : 1,
                      ),
                      width:
                      200,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Text('Saldo: ${widget.income}',
                        style: const TextStyle(color: Colors.white, fontSize: 16)),
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
