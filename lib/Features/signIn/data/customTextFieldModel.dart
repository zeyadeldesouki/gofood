import 'package:flutter/widgets.dart';

class Customtextfieldmodel {
  final TextEditingController? controller;
  final String hinttext;
  final Widget? label;
  final List<FormFieldValidator<String>>? validator;
  final bool obscureText;

  Customtextfieldmodel( {
    this.obscureText = false,
    this.validator,
    required this.controller,
    required this.hinttext,
    required this.label,
  });
}
