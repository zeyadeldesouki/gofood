import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:gofood/Core/appRouting.dart';
import 'package:gofood/Core/appStyles.dart';
import 'package:gofood/Core/authService.dart';
import 'package:gofood/Core/customButton.dart';
import 'package:gofood/Core/customSnackBar.dart';
import 'package:gofood/Features/signIn/data/customButtonModel.dart';
import 'package:gofood/Features/signIn/data/customTextFieldModel.dart';
import 'package:gofood/Features/signIn/presentation/views/widgets/customTextField.dart';

class Resetpasswordview extends StatefulWidget {
  const Resetpasswordview({super.key});

  @override
  State<Resetpasswordview> createState() => _ResetpasswordviewState();
}

class _ResetpasswordviewState extends State<Resetpasswordview> {
  final TextEditingController controller = TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey();

  @override
  void dispose() {
    super.dispose();
    formkey.currentState?.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var email = GoRouterState.of(context).extra as String;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: formkey,
          child: Column(
            children: [
              Text("Reset Password", style: AppStyles.text20(context)),
              Text("Enter your new password", style: AppStyles.text14(context)),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.1),
              customtextfield(
                customtextfieldmodel: Customtextfieldmodel(
                  obscureText: true,
                  controller: controller,
                  validator: [
                    FormBuilderValidators.required(
                      errorText: "Password is required",
                    ),
                    FormBuilderValidators.minLength(
                      6,
                      errorText: "Password must be at least 6 characters",
                    ),
                  ],
                  hinttext: "Password",
                  label: const Text("Password"),
                ),
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),
              customtextfield(
                customtextfieldmodel: Customtextfieldmodel(
                  obscureText: true,
                  validator: [
                    FormBuilderValidators.required(
                      errorText: "Password is required",
                    ),
                    (value) =>
                        controller.text == value
                            ? null
                            : "Password does not match",

                    FormBuilderValidators.minLength(
                      6,
                      errorText: "Password must be at least 6 characters",
                    ),
                  ],
                  hinttext: "Confirm Password",
                  label: const Text("Confirm Password"),
                ),
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.1),
              customButton(
                custombuttonmodel: Custombuttonmodel(
                  minimumSize: Size(MediaQuery.sizeOf(context).width * 0.8, 50),
                  text: "Done",
                  onPressed: () async {
                    await authService().resetPassword(email);
                    customSnackBar(
                      context: context,
                      content: "Password Reset Successfully",
                      backgroundColor: Colors.green,
                    );
                    GoRouter.of(context).push(AppRoutes.kSignIn);
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
