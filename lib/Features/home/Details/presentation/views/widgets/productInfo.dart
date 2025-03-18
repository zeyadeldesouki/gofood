import 'package:flutter/material.dart';
import 'package:gofood/Core/apiKeys.dart';
import 'package:gofood/Core/appStyles.dart';
import 'package:gofood/Core/customButton.dart';
import 'package:gofood/Core/stripeService.dart';
import 'package:gofood/Features/home/data/models/recipes/recipe.dart';
import 'package:gofood/Features/signIn/data/customButtonModel.dart';

class productInfo extends StatelessWidget {
  const productInfo({super.key, required this.recipes});

  final Recipe recipes;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          recipes.name ?? "",
          style: AppStyles.text22(context).copyWith(color: Colors.orange),
        ),
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.01),
        Text("Ingredients", style: AppStyles.text20(context)),
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.01),

        ...recipes.ingredients!
            .sublist(0, 5)
            .map(
              (ingredient) => Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Text(ingredient, style: AppStyles.text16(context)),
              ),
            ),
        const Expanded(child: SizedBox()),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "RATING ${recipes.rating.toString()}",
              style: AppStyles.text20(context),
            ),
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
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.01),
      ],
    );
  }
}
