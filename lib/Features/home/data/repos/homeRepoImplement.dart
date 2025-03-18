import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:gofood/Core/Failure.dart';
import 'package:gofood/Core/apiService.dart';
import 'package:gofood/Features/home/data/models/chicken_model/meal.dart';
import 'package:gofood/Features/home/data/models/recipes/recipe.dart';
import 'package:gofood/Features/home/data/repos/homeRepo.dart';

class Homerepoimplement extends HomeRepo {
  final Apiservice apiservice = Apiservice();

  @override
  Future<Either<Failure, List<Meal>>> getfood({
    required int limit,
    required int skip,
  }) async {
    try {
      var data = await apiservice.get(
        baseUrl: 'https://www.themealdb.com/api/json/v1/1',
        endpoint: "filter.php?a=Croatian&&c=Chicken",
        limit: limit,
        skip: skip,
      );
      final meallist =
          (data['meals'] as List).map((e) => Meal.fromJson(e)).toList();
      // List<Meal> meallist = [];
      // for (var element in data['meals']) {
      //   meallist.add(Meal.fromJson(element));
      // }
      return right(meallist);
    } catch (e) {
      if (e is DioException) {
        return left(Serverfailure.fromDio(e));
      }
      return left(Serverfailure(err: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Recipe>>> getRecipe({
    required int limit,
    required int skip,
  }) async {
    try {
      var data = await apiservice.get(
        baseUrl: "https://dummyjson.com",
        endpoint: "recipes",
        limit: limit,
        skip: skip,
      );
      var recipes =
          (data['recipes'] as List).map((e) {
            return Recipe.fromJson(e);
          }).toList();
      return right(recipes);
    } catch (e) {
      if (e is DioException) {
        return left(Serverfailure.fromDio(e));
      }
      return left(Serverfailure(err: e.toString()));
    }
  }
}
