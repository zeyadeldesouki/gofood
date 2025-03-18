import 'package:bloc/bloc.dart';
import 'package:gofood/Features/home/data/models/recipes/recipe.dart';
import 'package:gofood/Features/home/data/repos/homeRepoImplement.dart';
import 'package:meta/meta.dart';
part 'recipe_state.dart';

class RecipeCubit extends Cubit<RecipeState> {
  final Homerepoimplement homerepoimplement = Homerepoimplement();
  final int limit = 10;
  int skip = 0;
  bool hasMoreData = true;
  List<Recipe> recipes = [];

  RecipeCubit() : super(RecipeCubitInitial());

  Future<void> getRecipe({bool loadMore = false}) async {
    if (!hasMoreData && loadMore) return;
    if (!loadMore) {
      skip = 0;
      hasMoreData = true;
      recipes.clear();
      emit(RecipeCubitLoading());
    }

    var data = await homerepoimplement.getRecipe(limit: limit, skip: skip);

    data.fold(
      (fail) {
        emit(RecipeCubitFailure(err: fail.err));
      },
      (newRecipes) {
        if (newRecipes.isEmpty) {
          hasMoreData = false;
        } else {
          recipes.addAll(newRecipes);
          skip += limit;
        }

        emit(RecipeCubitSucess(recipes: recipes));
      },
    );
  }
}
