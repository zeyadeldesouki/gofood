import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gofood/Core/appStyles.dart';
import 'package:gofood/Features/home/presentation/views/manager/foodcubit/food_cubit.dart';
import 'package:gofood/Features/home/presentation/views/widgets/bestOfferItem.dart';
import 'package:gofood/Features/home/presentation/views/widgets/offer.dart';
import 'package:gofood/Features/home/presentation/views/widgets/searchView.dart';
import 'package:gofood/Features/home/presentation/views/widgets/topItemListView.dart';

class Homeview extends StatefulWidget {
  const Homeview({super.key});

  @override
  State<Homeview> createState() => _HomeviewState();
}

class _HomeviewState extends State<Homeview> {
  final List<String> _suggestions = ['One', 'Two', 'Three'];
  final SearchController _searchController = SearchController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FoodCubit()..getfood(),
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
                backgroundImage: NetworkImage(
                  "https://cdn-icons-png.freepik.com/256/957/957274.png?ga=GA1.1.220360408.1741291641&semt=sph",
                ),
              ),
            ),
          ],
          centerTitle: true,
          title: const Text("GoFood"),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SearchView(
                  searchController: _searchController,
                  suggestions: _suggestions,
                ),
                SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),
                const offerContainer(),
                SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),
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
                            .shimmer(duration: const Duration(seconds: 5)),
                      );
                    }
                    if (state is FoodFaliure) {
                      return Text(state.err);
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
                Text("Best Offers", style: AppStyles.text20(context)),
                const Expanded(child: bestOfferItem()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
