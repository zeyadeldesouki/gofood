import 'package:flutter/widgets.dart';

class Customtextfieldmodel {
  final TextEditingController? controller;
  final String hinttext;
  final Widget? label;
  final List<FormFieldValidator<String>>? validator;
  final bool obscureText;
  final TextInputType? keyboardType;

  Customtextfieldmodel({
    this.keyboardType = TextInputType.text, 
    this.obscureText = false,
    this.validator,
    this.controller,
    required this.hinttext,
    required this.label,
  });
}
