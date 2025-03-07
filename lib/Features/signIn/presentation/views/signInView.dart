import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gofood/Core/appRouting.dart';
import 'package:gofood/Core/appStyles.dart';
import 'package:gofood/Core/customButton.dart';
import 'package:gofood/Features/appView/presentation/views/applogo.dart';
import 'package:gofood/Features/signIn/data/customButtonModel.dart';
import 'package:gofood/Features/signIn/presentation/views/widgets/customTextField.dart';

class Signinview extends StatelessWidget {
  const Signinview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Applogo(),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),
              const customtextfield(),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),
              const customtextfield(),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),
              Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  "Forgot Password?",
                  style: AppStyles.text14(context),
                ),
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),

              customButton(
                custombuttonmodel: Custombuttonmodel(
                  text: "Sign In",
                  onPressed: () {},
                  minimumSize: Size(MediaQuery.sizeOf(context).width * 0.8, 50),
                ),
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),

              customButton(
                custombuttonmodel: Custombuttonmodel(
                  text: "Sign In With Facebook",
                  onPressed: () {},
                  minimumSize: Size(MediaQuery.sizeOf(context).width * 0.8, 50),
                ),
              ),
              const Expanded(child: SizedBox()),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "don't have an account? ",
                    style: AppStyles.text14(context),
                  ),
                  InkWell(
                    onTap: () {
                      GoRouter.of(context).push(AppRoutes.kSignup);
                    },
                    child: Text("Sign Up", style: AppStyles.text14(context)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
