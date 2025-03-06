import 'package:flutter/material.dart';
import 'package:gofood/Core/appStyles.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: CircleAvatar(
              radius: 100,
              backgroundImage: AssetImage(
                'assets/images/cute_chef_girl_in_uniform_character_holding_a_turner_food_restaurant_logo_cartoon_art_illustration.jpg',
              ),
            ),
          ),
          Text(
            'Gofood',
            style: AppStyles.text22(context).copyWith(color: Colors.orange),
          ),
          Text("the best of food for you", style: AppStyles.text14(context)),
        ],
      ),
    );
  }
}
