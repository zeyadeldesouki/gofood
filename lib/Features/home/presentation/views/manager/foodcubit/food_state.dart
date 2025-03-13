part of 'food_cubit.dart';

@immutable
sealed class FoodState {}

final class FoodInitial extends FoodState {}

final class FoodLoaded extends FoodState {}

final class FoodSucess extends FoodState {
  final List<Meal> meallist;

  FoodSucess({required this.meallist});
}

final class FoodFaliure extends FoodState {
  final String err;

  FoodFaliure({required this.err});
}
