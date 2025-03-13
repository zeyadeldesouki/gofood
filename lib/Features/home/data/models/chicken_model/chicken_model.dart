import 'meal.dart';

class ChickenModel {
  List<Meal>? meals;

  ChickenModel({this.meals});

  factory ChickenModel.fromJson(Map<String, dynamic> json) => ChickenModel(
    meals:
        (json['meals'] as List<dynamic>?)
            ?.map((e) => Meal.fromJson(e as Map<String, dynamic>))
            .toList(),
  );

  Map<String, dynamic> toJson() => {
    'meals': meals?.map((e) => e.toJson()).toList(),
  };
}
