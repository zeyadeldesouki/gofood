import 'package:flutter/widgets.dart';
import 'package:gofood/Features/home/data/models/chicken_model/meal.dart';
import 'package:gofood/Features/home/presentation/views/widgets/topItem.dart';

class Topitemlistview extends StatefulWidget {
  const Topitemlistview({super.key, required this.meallist,});

  final List<Meal> meallist;

  @override
  State<Topitemlistview> createState() => _TopitemlistviewState();
}

class _TopitemlistviewState extends State<Topitemlistview> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.1,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.meallist.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: TopItem(meal:widget.meallist[index]),
          );
        },
      ),
    );
  }
}
