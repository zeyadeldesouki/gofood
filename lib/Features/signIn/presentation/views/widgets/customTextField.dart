import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:gofood/Core/appStyles.dart';
import 'package:gofood/Features/signIn/data/customTextFieldModel.dart';

class customtextfield extends StatelessWidget {
  const customtextfield({super.key, required this.customtextfieldmodel});
  final Customtextfieldmodel customtextfieldmodel;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: FormBuilderValidators.compose(customtextfieldmodel.validator??[]),
      controller: customtextfieldmodel.controller,
      obscureText: customtextfieldmodel.obscureText,
      decoration: InputDecoration(
        hintText: customtextfieldmodel.hinttext,
        hintStyle: AppStyles.text14(context),
        label: customtextfieldmodel.label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
