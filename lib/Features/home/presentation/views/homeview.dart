import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gofood/Core/appStyles.dart';
import 'package:gofood/Features/home/presentation/views/manager/foodcubit/food_cubit.dart';
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
        appBar: AppBar(centerTitle: true, title: const Text("Home")),
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
                        child: Topitemlistview(meallist: state.meallist),
                      );
                    }
                    if (state is FoodFaliure) {
                      return Text(state.err);
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.network(
                        "https://th.bing.com/th/id/OIP.9yKD8jUAgbI1ZX-PRDhDnAHaE8?w=238&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7",
                        fit: BoxFit.cover,
                      ),
                    ),
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
