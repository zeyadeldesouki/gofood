import 'package:flutter/material.dart';
import 'package:gofood/Core/appStyles.dart';
import 'package:gofood/Features/signIn/data/customButtonModel.dart';

class customButton extends StatelessWidget {
  const customButton({super.key, required this.custombuttonmodel});
  final Custombuttonmodel custombuttonmodel;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: custombuttonmodel.minimumSize,
      ),
      onPressed: custombuttonmodel.onPressed,
      child: Text(custombuttonmodel.text, style: AppStyles.text14(context)),
    );
  }
}
