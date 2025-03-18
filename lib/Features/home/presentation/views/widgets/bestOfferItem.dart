import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:gofood/Core/appRouting.dart';
import 'package:gofood/Core/appStyles.dart';
import 'package:gofood/Features/home/data/models/recipes/recipe.dart';

class bestOfferItem extends StatelessWidget {
  const bestOfferItem({super.key, required this.recipes});

  final List<Recipe> recipes;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: BlurEffect.defaultBlur,
        mainAxisSpacing: BlurEffect.defaultBlur,
      ),
      itemCount: recipes.length,
      itemBuilder: (context, index) {
        String firstTag = recipes[index].tags?[0] ?? "";
        String firstFiveChars =
            firstTag.length > 5 ? firstTag.substring(0, 5) : firstTag;
        return Card(
          elevation: 10,
          margin: const EdgeInsets.all(16),
          child: Stack(
            children: [
              InkWell(
                onTap: () {
                  GoRouter.of(
                    context,
                  ).push(AppRoutes.kDetails, extra: recipes[index]);
                },
                child: Image.network(
                  width: MediaQuery.sizeOf(context).width,
                  recipes[index].image ??
                      "https://th.bing.com/th/id/OIP.9nl2eFOD4SKNC_FIn0bSqQHaFj?w=193&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7",
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 0,
                right: 10,
                left: 10,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.8),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(firstFiveChars, style: AppStyles.text14(context)),
                      Text(
                        recipes[index].mealType?[0] ?? "",
                        style: AppStyles.text14(context).copyWith(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
