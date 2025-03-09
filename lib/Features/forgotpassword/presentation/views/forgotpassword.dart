import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:gofood/Core/appRouting.dart';
import 'package:gofood/Core/appStyles.dart';
import 'package:gofood/Core/customButton.dart';
import 'package:gofood/Features/signIn/data/customButtonModel.dart';
import 'package:gofood/Features/signIn/data/customTextFieldModel.dart';
import 'package:gofood/Features/signIn/presentation/views/widgets/customTextField.dart';

class Forgotpassword extends StatelessWidget {
  const Forgotpassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text("Forgot Password", style: AppStyles.text20(context)),
            Text(
              "Enter your email to reset your password",
              style: AppStyles.text14(context),
            ),
            customtextfield(
              customtextfieldmodel: Customtextfieldmodel(
                hinttext: "Email",
                label: const Text("Email"),
              ),
            ),
            customButton(
              custombuttonmodel: Custombuttonmodel(
                text: "Next",
                onPressed: () {
                  GoRouter.of(context).push(AppRoutes.kVerifiy);
                },
                minimumSize: Size(MediaQuery.sizeOf(context).width * 0.8, 50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
