//import 'package:dindin_app/common/widgets/custom_button.dart';
import 'package:dindin_app/common/widgets/custom_textfield.dart';
import 'package:dindin_app/constants/global_variaveis.dart';
import 'package:flutter/material.dart';

enum Auth {
  signin,
  signup,
}

class AuthTela extends StatefulWidget {
  static const String routeName = '/auth-tela';

  const AuthTela({Key? key}) : super(key: key);

  @override
  State<AuthTela> createState() => _AuthTelaState();
}

class _AuthTelaState extends State<AuthTela> {
  final Auth _auth = Auth.signup;
  final _signUpFormkey = GlobalKey<FormState>();
  //final _signInFormkey = GlobalKey<FormState>();

  final TextEditingController _nomecontroller = TextEditingController();
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _telefonecontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  final TextEditingController _rendacontroller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _nomecontroller.dispose();
    _emailcontroller.dispose();
    _telefonecontroller.dispose();
    _passwordcontroller.dispose();
    _rendacontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Controla DINDIN'),
        centerTitle: false,
        automaticallyImplyLeading: false,
        leadingWidth: 30,
        // ignore: prefer_const_constructors
        leading: Icon(Icons.menu),
      ),
      backgroundColor: GlobalVariables.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Text(
                'Bem vindo ao Controla DINDIN',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
              ListTile(
                tileColor: _auth == Auth.signup
                    ? GlobalVariables.greybackgroundColor
                    : GlobalVariables.backgroundColor,
                title: const Text(
                  'Realizar cadastro',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                color: GlobalVariables.backgroundColor,
                child: Form(
                  key: _signUpFormkey,
                  child: Column(children: [
                    CustomTesxtField(
                      controller: _nomecontroller,
                      hintText: 'Nome',
                    ),
                    const SizedBox(height: 10),
                    CustomTesxtField(
                      controller: _emailcontroller,
                      hintText: 'Email',
                    ),
                    const SizedBox(height: 10),
                    CustomTesxtField(
                      controller: _telefonecontroller,
                      hintText: 'Telefone',
                    ),
                    const SizedBox(height: 10),
                    CustomTesxtField(
                      controller: _passwordcontroller,
                      hintText: 'Senha',
                    ),
                    const SizedBox(height: 10),
                    CustomTesxtField(
                      controller: _rendacontroller,
                      hintText: 'Renda',
                    ),
                    const SizedBox(height: 10),
                    //CustomButton(
                    //  text: 'Cadastrar',
                    //  ontap: () {},
                    // ),
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
