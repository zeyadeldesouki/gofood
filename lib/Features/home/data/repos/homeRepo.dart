import 'package:dartz/dartz.dart';
import 'package:gofood/Core/Failure.dart';
import 'package:gofood/Features/home/data/models/chicken_model/meal.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<Meal>>> getfood({
    required int limit,
    required int skip,
  });
}