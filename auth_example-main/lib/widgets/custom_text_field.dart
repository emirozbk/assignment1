import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final bool obscureText;
  final String labelText;
  final String hintText;
  final IconData iconData;
  final String? Function(String?) validator;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;

  const CustomTextField(
      {Key? key,
      required this.controller,
      this.obscureText = false,
      required this.labelText,
      required this.hintText,
      required this.validator,
      required this.iconData,
      this.textInputType,
      this.textInputAction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        icon: Icon(iconData),
      ),
      validator: validator,
      keyboardType: textInputType,
      textInputAction: textInputAction,
    );
  }
}
