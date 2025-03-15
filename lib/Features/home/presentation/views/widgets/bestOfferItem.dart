import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gofood/Core/appStyles.dart';

class bestOfferItem extends StatelessWidget {
  const bestOfferItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: BlurEffect.defaultBlur,
        mainAxisSpacing: BlurEffect.defaultBlur,
      ),
      itemCount: 20,
      itemBuilder: (context, index) {
        return Card(
          elevation: 10,
          margin: const EdgeInsets.all(16),
          child: Stack(
            children: [
              Image.network(
                width: MediaQuery.sizeOf(context).width,
                "https://th.bing.com/th/id/OIP.9nl2eFOD4SKNC_FIn0bSqQHaFj?w=193&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7",
                fit: BoxFit.cover,
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
                      Text("\$20", style: AppStyles.text16(context)),
                      const Icon(Icons.favorite_border, color: Colors.red),
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
