import 'package:bloc/bloc.dart';
import 'package:gofood/Features/home/data/models/chicken_model/meal.dart';
import 'package:gofood/Features/home/data/repos/homeRepoImplement.dart';
import 'package:meta/meta.dart';

part 'food_state.dart';

class FoodCubit extends Cubit<FoodState> {
  final Homerepoimplement homerepoimplement = Homerepoimplement();

  final int limit = 5;
  int skip = 0;
  bool hasData = true;
  List<Meal> meallist = [];
  FoodCubit() : super(FoodInitial());
  Future<void> getfood({bool loadData = false}) async {
    if (!hasData && loadData) return;
    if (!loadData) {
      skip = 0;
      hasData = true;
      meallist.clear();
      emit(FoodLoaded());
    }

    var data = await homerepoimplement.getfood(limit: limit, skip: skip);

    data.fold(
      (Failure) {
        emit(FoodFaliure(err: Failure.err));
      },
      (meal) {
        if (meallist.isEmpty) {
          hasData = false;
        } else {
          meallist.addAll(meal);
          skip += limit;
        }
        emit(FoodSucess(meallist: meal));
      },
    );
  }
}
