import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gofood/Core/customAppBar.dart';
import 'package:gofood/Features/home/Details/presentation/views/widgets/productInfo.dart';
import 'package:gofood/Features/home/data/models/recipes/recipe.dart';

class Detailsview extends StatelessWidget {
  const Detailsview({super.key});

  @override
  Widget build(BuildContext context) {
    var recipes = GoRouterState.of(context).extra as Recipe;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.sizeOf(context).height,
              decoration: BoxDecoration(color: Colors.grey.shade200),
              child: Image.network(
                width: MediaQuery.sizeOf(context).width,
                recipes.image ??
                    "https://th.bing.com/th/id/OIP.9nl2eFOD4SKNC_FIn0bSqQHaFj?w=193&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7",
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: MediaQuery.sizeOf(context).height * 0.45,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: productInfo(recipes: recipes),
                ),
              ),
            ),
            const customAppBar(),
          ],
        ),
      ),
    );
  }
}
