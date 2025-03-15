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
            "https://th.bing.com/th/id/OIP.9nl2eFOD4SKNC_FIn0bSqQHaFj?w=193&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7",
          ),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
