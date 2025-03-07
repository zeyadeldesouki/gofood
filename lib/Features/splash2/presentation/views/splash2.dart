import 'package:flutter/material.dart';
import 'package:gofood/Core/appStyles.dart';
import 'package:gofood/Features/splash2/data/pageViewModel.dart';
import 'package:gofood/Features/splash2/presentation/views/widgets/buildpageview.dart';

class Splash2 extends StatefulWidget {
  const Splash2({super.key});

  @override
  State<Splash2> createState() => _Splash2State();
}

class _Splash2State extends State<Splash2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.sizeOf(context).height,
            color: Colors.orange,
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.sizeOf(context).height * 0.7,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: const SafeArea(child: Column(children: [Buildpageview()])),
            ),
          ),
        ],
      ),
    );
  }
}
