import 'package:dindin_app/constants/error_handling.dart';
import 'package:dindin_app/constants/global_variaveis.dart';
import 'package:dindin_app/constants/utils.dart';
import 'package:dindin_app/models/user.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class AuthService {
  void signUpUsuario({
    required BuildContext context,
    required String email,
    required String password,
    required String name,
    required String telefone,
    required String renda,
  }) async {
    try {
      User user = User(
          id: '',
          email: email,
          password: password,
          name: name,
          telefone: telefone,
          renda: renda,
          type: '',
          token: '');
      http.Response res = await http.post(
        Uri.parse('$uri/api/singup'),
        body: user.toJson(),
        headers: <String, String>{
          'Content-type': 'application/json; charset=UTF-8',
        },
      );

      // ignore: use_build_context_synchronously
      httpErrorHandle(
          response: res,
          context: context,
          omSucess: () {
            showSnackBar(
              context,
              'CADASTRO CRIADA COM SUCESSO',
            );
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
