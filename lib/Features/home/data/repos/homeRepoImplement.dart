import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:gofood/Core/Failure.dart';
import 'package:gofood/Core/apiService.dart';
import 'package:gofood/Features/home/data/models/chicken_model/meal.dart';
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
        limit: limit,
        skip: skip,
        endpoint: "filter.php?a=Croatian&&c=Chicken",
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
}
