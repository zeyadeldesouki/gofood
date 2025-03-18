part of 'recipe_cubit.dart';

@immutable
sealed class RecipeState {}

final class RecipeCubitInitial extends RecipeState {}

final class RecipeCubitLoading extends RecipeState {}

final class RecipeCubitSucess extends RecipeState {
  final List<Recipe> recipes;

  RecipeCubitSucess({required this.recipes});
}

final class RecipeCubitFailure extends RecipeState {
  final String err;

  RecipeCubitFailure({required this.err});
}
