import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gofood/Core/appStyles.dart';
import 'package:gofood/Core/customButton.dart';
import 'package:gofood/Features/VerifiyView/presentation/views/widgets/OTP.dart';
import 'package:gofood/Features/signIn/data/customButtonModel.dart';

class VerifiyView extends StatelessWidget {
  const VerifiyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text("Verification", style: AppStyles.text20(context)),
            Text(
              "Check your email to verify your account",
              style: AppStyles.text14(context),
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.1),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OTPcontainer(),
                OTPcontainer(),
                OTPcontainer(),
                OTPcontainer(),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Didn't receive a code? ",
                  style: AppStyles.text14(context),
                ),
                Text("Resend", style: AppStyles.text14(context)),
              ],
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.1),
            customButton(
              custombuttonmodel: Custombuttonmodel(
                minimumSize: Size(MediaQuery.sizeOf(context).width * 0.8, 50),
                text: "Submit",
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
