import 'package:dindin_app/common/widgets/custom_textfield.dart';
import 'package:dindin_app/constants/global_variaveis.dart';
import 'package:dindin_app/feature/auth/services/auth_service.dart';
import 'package:dindin_app/feature/auth/telas/criar_categorias.dart';
import 'package:flutter/material.dart';

import 'package:dindin_app/common/widgets/custom_button.dart';

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

  final AuthService authService = AuthService();
  final TextEditingController _namecontroller = TextEditingController();
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _telefonecontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  final TextEditingController _rendacontroller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _namecontroller.dispose();
    _emailcontroller.dispose();
    _telefonecontroller.dispose();
    _passwordcontroller.dispose();
    _rendacontroller.dispose();
  }

  void signUpUser() {
    authService.signUpUsuario(
      context: context,
      email: _emailcontroller.text,
      password: _passwordcontroller.text,
      name: _namecontroller.text,
      telefone: _telefonecontroller.text,
      renda: _rendacontroller.text,
    );
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
      resizeToAvoidBottomInset: false,
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
                  child: Column(
                    children: [
                      CustomTesxtField(
                        controller: _namecontroller,
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
                      CustomButton(
                        text: 'Cadastrar',
                        onTap: () {
                          if (_signUpFormkey.currentState!.validate()) {
                            signUpUser();
                          }
                          () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const CriarCategorias(),
                                ),
                              );
                        },
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const AuthTela(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
