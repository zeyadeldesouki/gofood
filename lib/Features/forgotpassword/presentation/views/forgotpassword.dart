import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:gofood/Core/appRouting.dart';
import 'package:gofood/Core/appStyles.dart';
import 'package:gofood/Core/customButton.dart';
import 'package:gofood/Features/signIn/data/customButtonModel.dart';
import 'package:gofood/Features/signIn/data/customTextFieldModel.dart';
import 'package:gofood/Features/signIn/presentation/views/widgets/customTextField.dart';

class Forgotpassword extends StatefulWidget {
  const Forgotpassword({super.key});

  @override
  State<Forgotpassword> createState() => _ForgotpasswordState();
}

class _ForgotpasswordState extends State<Forgotpassword> {
  final TextEditingController controller = TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey();
  @override
  void dispose() {
    controller.dispose();
    formkey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: formkey,
          child: Column(
            children: [
              Text("Forgot Password", style: AppStyles.text20(context)),
              Text(
                "Enter your email to reset your password",
                style: AppStyles.text14(context),
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.1),
              customtextfield(
                customtextfieldmodel: Customtextfieldmodel(
                  controller: controller,
                  validator: [
                    FormBuilderValidators.required(
                      errorText: "Email is required",
                    ),
                    FormBuilderValidators.email(
                      errorText: "Enter a valid email",
                    ),
                  ],
                  hinttext: "Email",
                  label: const Text("Email"),
                ),
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.1),
              customButton(
                custombuttonmodel: Custombuttonmodel(
                  text: "Next",
                  minimumSize: Size(MediaQuery.sizeOf(context).width * 0.8, 50),

                  onPressed: () {
                    if (formkey.currentState!.validate()) {
                      GoRouter.of(
                        context,
                      ).push(AppRoutes.kForgotVerifiy, extra: controller.text);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
