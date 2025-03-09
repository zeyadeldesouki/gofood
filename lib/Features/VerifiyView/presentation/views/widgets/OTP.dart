import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OTPcontainer extends StatelessWidget {
  const OTPcontainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.orange,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
