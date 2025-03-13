import 'package:flutter/widgets.dart';

class offerContainer extends StatelessWidget {
  const offerContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height * 0.17,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: const DecorationImage(
          image: NetworkImage(
            "https://th.bing.com/th?id=OIP.OM_YQDFEEZ6NPj0XapYwFgHaEo&w=316&h=197&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2",
          ),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
