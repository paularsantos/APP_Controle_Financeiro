import 'package:dindin_app/constants/global_variaveis.dart';
import 'package:flutter/material.dart';

class CustomTesxtField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;

  const CustomTesxtField({
    Key? key,
    required this.controller,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: GlobalVariables.secondaryColor),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: GlobalVariables.secondaryColor),
          ),
        ),
        validator: (val) {
          if (val == null || val.isEmpty) {
            return 'FAVOR DIGITAR SEU $hintText';
          }
          return null;
        });
  }
}
