import 'dart:math';

import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:gofood/Core/appRouting.dart';
import 'package:gofood/Core/appStyles.dart';
import 'package:gofood/Core/authService.dart';
import 'package:gofood/Core/customButton.dart';
import 'package:gofood/Features/appView/presentation/views/applogo.dart';
import 'package:gofood/Features/signIn/data/customButtonModel.dart';
import 'package:gofood/Features/signIn/data/customTextFieldModel.dart';
import 'package:gofood/Features/signIn/presentation/views/widgets/customTextField.dart';

class Signinview extends StatefulWidget {
  const Signinview({super.key});

  @override
  State<Signinview> createState() => _SigninviewState();
}

class _SigninviewState extends State<Signinview> {
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    formKey.currentState?.dispose();
    email.dispose();
    password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                const Applogo(),
                SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),
                customtextfield(
                  customtextfieldmodel: Customtextfieldmodel(
                    validator: [
                      FormBuilderValidators.required(
                        errorText: "Email is required",
                      ),
                      FormBuilderValidators.email(
                        errorText: "Enter a valid email",
                      ),

                      FormBuilderValidators.max(30),
                    ],
                    hinttext: "Email",
                    label: const Text("Email"),
                    controller: email,
                  ),
                ),
                SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),
                customtextfield(
                  customtextfieldmodel: Customtextfieldmodel(
                    hinttext: "Password",
                    label: const Text("Password"),
                    controller: password,
                    validator: [
                      FormBuilderValidators.required(
                        errorText: "Password is required",
                      ),
                      FormBuilderValidators.password(
                        errorText: "Enter a valid password",
                      ),
                      FormBuilderValidators.minLength(
                        6,
                        errorText: "Password must be at least 6 characters",
                      ),

                      FormBuilderValidators.maxLength(
                        30,
                        errorText: "Password must be at most 30 characters",
                      ),
                    ],
                  ),
                ),
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
                    onPressed: () {
                      if (formKey.currentState!.validate()){
                        authService().signInWithEmailAndPassword(
                          email.text,
                          password.text,
                        );
                      }
                    },
                    minimumSize: Size(
                      MediaQuery.sizeOf(context).width * 0.8,
                      50,
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),
                customButton(
                  custombuttonmodel: Custombuttonmodel(
                    text: "Sign In With Facebook",
                    onPressed: () {},
                    minimumSize: Size(
                      MediaQuery.sizeOf(context).width * 0.8,
                      50,
                    ),
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
      ),
    );
  }
}
