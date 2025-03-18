import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gofood/Features/home/data/models/chicken_model/meal.dart';

class TopItem extends StatelessWidget {
  const TopItem({super.key, required this.meal});

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 30,
      backgroundColor: Colors.white,
      backgroundImage: NetworkImage(meal.strMealThumb ?? ""),
    );
  }
}
