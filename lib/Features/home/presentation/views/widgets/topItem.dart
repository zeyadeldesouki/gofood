import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gofood/Features/home/data/models/chicken_model/meal.dart';

class TopItem extends StatelessWidget {
  const TopItem({super.key, required this.meal,});

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize:
          MainAxisSize.min, // Prevents Column from taking infinite height
      children: [
        Flexible(
          // Makes the container flexible in height
          child: AspectRatio(
            aspectRatio: 12 / 3.5,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: NetworkImage(meal.strMealThumb??""),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     const Icon(Icons.attach_money, size: 16, color: Colors.green),
        //     const SizedBox(width: 4),
        //     Text(
        //       '\$${price.toStringAsFixed(2)}',
        //       style:  AppStyles.text14(context),
        //     ),
        //   ],
        // ),
      ],
    );
  }
}
