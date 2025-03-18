import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:gofood/Core/appRouting.dart';
import 'package:gofood/Core/appStyles.dart';
import 'package:gofood/Core/authService.dart';
import 'package:gofood/Core/customButton.dart';
import 'package:gofood/Core/customSnackBar.dart';
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
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    children: [
                      const Applogo(),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.02,
                      ),
                      customtextfield(
                        customtextfieldmodel: Customtextfieldmodel(
                          validator: [
                            FormBuilderValidators.required(
                              errorText: "Email is required",
                            ),
                            FormBuilderValidators.email(
                              errorText: "Enter a valid email",
                            ),
                            FormBuilderValidators.maxLength(30),
                          ],
                          hinttext: "Email",
                          label: const Text("Email"),
                          controller: email,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.02,
                      ),
                      customtextfield(
                        customtextfieldmodel: Customtextfieldmodel(
                          hinttext: "Password",
                          label: const Text("Password"),
                          controller: password,
                          obscureText: true,
                          validator: [
                            FormBuilderValidators.required(
                              errorText: "Password is required",
                            ),
                            FormBuilderValidators.minLength(
                              6,
                              errorText:
                                  "Password must be at least 6 characters",
                            ),
                            FormBuilderValidators.maxLength(
                              30,
                              errorText:
                                  "Password must be at most 30 characters",
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.02,
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: InkWell(
                          onTap:
                              () =>
                                  GoRouter.of(context).push(AppRoutes.kForget),
                          child: Text(
                            "Forgot Password?",
                            style: AppStyles.text14(context),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.02,
                      ),
                      customButton(
                        custombuttonmodel: Custombuttonmodel(
                          text: "Sign In",
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              try {
                                await authService().signInWithEmailAndPassword(
                                  email.text,
                                  password.text,
                                );
                                customSnackBar(
                                  context: context,
                                  content: "Sign In Successfully",
                                  backgroundColor: Colors.green,
                                );
                                GoRouter.of(context).push(AppRoutes.kHome);
                              } catch (e) {
                                customSnackBar(
                                  context: context,
                                  content: e.toString(),
                                  backgroundColor: Colors.red,
                                );
                              }
                            }
                          },
                          minimumSize: Size(
                            MediaQuery.sizeOf(context).width * 0.8,
                            50,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.02,
                      ),
                      customButton(
                        custombuttonmodel: Custombuttonmodel(
                          text: "Sign In With Google",
                          onPressed: () async {
                            try {
                              await authService().signInWithGoogle();
                              customSnackBar(
                                context: context,
                                content: "Sign In Successfully",
                                backgroundColor: Colors.green,
                              );
                              GoRouter.of(context).push(AppRoutes.kHome);
                            } catch (e) {
                              customSnackBar(
                                context: context,
                                content: e.toString(),
                                backgroundColor: Colors.red,
                              );
                            }
                          },
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
                            "Don't have an account? ",
                            style: AppStyles.text14(context),
                          ),
                          InkWell(
                            onTap: () {
                              GoRouter.of(context).push(AppRoutes.kSignup);
                            },
                            child: Text(
                              "Sign Up",
                              style: AppStyles.text14(context),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
