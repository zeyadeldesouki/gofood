import 'package:flutter/material.dart';

class Splash2 extends StatelessWidget {
  const Splash2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.sizeOf(context).height,
            color: Colors.red,
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: MediaQuery.sizeOf(context).height * 0.3,
              decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
