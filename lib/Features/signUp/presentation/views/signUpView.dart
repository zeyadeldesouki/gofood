import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:gofood/Core/appRouting.dart';
import 'package:gofood/Core/appStyles.dart';
import 'package:gofood/Core/authService.dart';
import 'package:gofood/Core/customButton.dart';
import 'package:gofood/Features/signIn/data/customButtonModel.dart';
import 'package:gofood/Features/signIn/data/customTextFieldModel.dart';
import 'package:gofood/Features/signIn/presentation/views/widgets/customTextField.dart';

class Signupview extends StatefulWidget {
  const Signupview({super.key});

  @override
  State<Signupview> createState() => _SignupviewState();
}

class _SignupviewState extends State<Signupview> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey();

  @override
  void dispose() {
    super.dispose();
    email.dispose();
    password.dispose();
    formkey.currentState?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formkey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Create Account", style: AppStyles.text20(context)),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),

              customtextfield(
                customtextfieldmodel: Customtextfieldmodel(
                  validator: [
                    FormBuilderValidators.required(
                      errorText: "Full Name is required",
                    ),
                  ],
                  hinttext: "Enter Full Name",
                  label: const Text("Full Name"),
                ),
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),
              customtextfield(
                customtextfieldmodel: Customtextfieldmodel(
                  validator: [
                    FormBuilderValidators.required(
                      errorText: "Phone Number is required",
                    ),
                  ],
                  hinttext: "Enter Phone Number",
                  label: const Text("Phone Number"),
                ),
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),

              customtextfield(
                customtextfieldmodel: Customtextfieldmodel(
                  controller: email,
                  validator: [
                    FormBuilderValidators.required(
                      errorText: "Email is required",
                    ),
                    FormBuilderValidators.email(
                      errorText: "Enter a valid email",
                    ),
                  ],
                  hinttext: "Enter Email",
                  label: const Text("Email"),
                ),
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),

              customtextfield(
                customtextfieldmodel: Customtextfieldmodel(
                  controller: password,
                  validator: [
                    FormBuilderValidators.required(
                      errorText: "Password is required",
                    ),
                    FormBuilderValidators.minLength(
                      6,
                      errorText: "Password must be at least 6 characters",
                    ),
                  ],
                  hinttext: "Enter Password",
                  label: const Text("Password"),
                ),
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),
              customtextfield(
                customtextfieldmodel: Customtextfieldmodel(
                  validator: [
                    FormBuilderValidators.required(
                      errorText: "Confirm Password is required",
                    ),
                    (value) =>
                        value != password.text ? "Passwords don't match" : null,
                  ],
                  hinttext: "Confirm Password",
                  label: const Text("Confirm Password"),
                ),
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.05),
              Align(
                child: customButton(
                  custombuttonmodel: Custombuttonmodel(
                    text: "Continue",
                    minimumSize: Size(
                      MediaQuery.sizeOf(context).width * 0.8,
                      50,
                    ),
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                        authService().signUpWithEmailAndPassword(
                          email.text,
                          password.text,
                        );
                        GoRouter.of(context).push(AppRoutes.kVerifiy);
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
