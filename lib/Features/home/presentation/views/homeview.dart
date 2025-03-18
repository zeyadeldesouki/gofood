import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gofood/Core/appStyles.dart';
import 'package:gofood/Features/home/presentation/views/manager/Recipecubit/recipe_cubit.dart';
import 'package:gofood/Features/home/presentation/views/manager/foodcubit/food_cubit.dart';
import 'package:gofood/Features/home/presentation/views/widgets/bestOfferItem.dart';
import 'package:gofood/Features/home/presentation/views/widgets/offer.dart';
import 'package:gofood/Features/home/presentation/views/widgets/topItemListView.dart';

class Homeview extends StatefulWidget {
  const Homeview({super.key});

  @override
  State<Homeview> createState() => _HomeviewState();
}

class _HomeviewState extends State<Homeview> {

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => FoodCubit()..getfood()),
        BlocProvider(create: (context) => RecipeCubit()..getRecipe()),
      ],
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.menu, color: Colors.black),
            onPressed: () {},
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 16),
              child: CircleAvatar(
                radius: 20,
                child: Icon(Icons.search, color: Colors.black),
              ),
            ),
          ],
          centerTitle: true,
          title: const Text("GoFood"),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.02,
                      ),
                      const offerContainer(),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.02,
                      ),
                      Text("Top Of Week", style: AppStyles.text20(context)),
                      BlocBuilder<FoodCubit, FoodState>(
                        builder: (context, state) {
                          if (state is FoodSucess) {
                            return NotificationListener<ScrollNotification>(
                              onNotification: (ScrollNotification scrollInfo) {
                                scrollInfo.metrics.pixels ==
                                        scrollInfo.metrics.maxScrollExtent
                                    ? context.read<FoodCubit>().getfood(
                                      loadData: true,
                                    )
                                    : null;
                                return true;
                              },
                              child: Topitemlistview(meallist: state.meallist)
                                  .animate()
                                  .shimmer(duration: const Duration(seconds: 2))
                                  .rotate(
                                    duration: const Duration(milliseconds: 900),
                                  ),
                            );
                          }
                          if (state is FoodFaliure) {
                            return Text(state.err);
                          } else {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        },
                      ),
                      Text("Best Offers", style: AppStyles.text20(context)),
                      Expanded(
                        child: BlocBuilder<RecipeCubit, RecipeState>(
                          builder: (context, state) {
                            if (state is RecipeCubitSucess) {
                              return NotificationListener<ScrollNotification>(
                                onNotification: (
                                  ScrollNotification notification,
                                ) {
                                  notification.metrics.pixels ==
                                          notification.metrics.maxScrollExtent
                                      ? context.read<RecipeCubit>().getRecipe(
                                        loadMore: true,
                                      )
                                      : null;
                                  return true;
                                },
                                child: bestOfferItem(
                                  recipes: state.recipes,
                                ).animate().scale(
                                  duration: const Duration(seconds: 2),
                                ),
                              );
                            } else if (state is RecipeCubitFailure) {
                              return Text(state.err);
                            } else {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
