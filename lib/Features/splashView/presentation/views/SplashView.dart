import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gofood/Core/appRouting.dart';
import 'package:gofood/Core/customButton.dart';
import 'package:gofood/Features/signIn/data/customButtonModel.dart';
import 'package:gofood/Features/splashView/presentation/views/widgets/buildpageview.dart';

class splashView extends StatefulWidget {
  const splashView({super.key});

  @override
  State<splashView> createState() => _splashViewState();
}

class _splashViewState extends State<splashView> {
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
              height: MediaQuery.sizeOf(context).height * 0.75,
              decoration: const BoxDecoration(
                color: Color(0xFFFFF2EF),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: const SafeArea(child: Column(children: [Buildpageview()])),
            ),
          ),
          Positioned(
            bottom: 30,
            left: 20,
            right: 20,
            child: Row(
              children: [
                Expanded(
                  child: customButton(
                    custombuttonmodel: Custombuttonmodel(
                      text: "SignUp",
                      onPressed: () {
                        GoRouter.of(context).push(AppRoutes.kSignup);
                      },
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: customButton(
                    custombuttonmodel: Custombuttonmodel(
                      text: "SignIn",
                      onPressed: () {
                        GoRouter.of(context).push(AppRoutes.kSignIn);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
