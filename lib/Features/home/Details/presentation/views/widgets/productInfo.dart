import 'package:flutter/material.dart';
import 'package:gofood/Core/apiKeys.dart';
import 'package:gofood/Core/appStyles.dart';
import 'package:gofood/Core/customButton.dart';
import 'package:gofood/Core/stripeService.dart';
import 'package:gofood/Features/signIn/data/customButtonModel.dart';

class productInfo extends StatelessWidget {
  const productInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Title",
          style: AppStyles.text22(context).copyWith(color: Colors.orange),
        ),
        const Expanded(child: SizedBox()),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("data"),
            customButton(
              custombuttonmodel: Custombuttonmodel(
                backgroundColor: Colors.orange,
                minimumSize: const Size(200, 60),
                text: "Buy Now",
                onPressed: () {
                  stripePayment(
                    context: context,
                    secretKey: Apikeys.secretKey,
                    publishableKey: Apikeys.publishableKey,
                    customId: Apikeys.customId,
                    amount: 200,
                    saveCard: true,
                    customerName: "Zeyad",
                  );
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
