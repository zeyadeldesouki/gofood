import 'package:flutter/widgets.dart';
import 'package:gofood/Core/appStyles.dart';
import 'package:gofood/Core/customButton.dart';
import 'package:gofood/Features/signIn/data/customButtonModel.dart';

class offerContainer extends StatelessWidget {
  const offerContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.95,
      height: MediaQuery.sizeOf(context).height * 0.17,
      decoration: BoxDecoration(
        color: const Color(0xffDCED8F),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 10,
            left: 10,
            child: Text("Deals For You", style: AppStyles.text20(context)),
          ),
          Positioned(
            top: 40,
            left: 10,
            child: Text(
              "Get 15% off on your first order",
              style: AppStyles.text14(context),
            ),
          ),
          Positioned(
            bottom: MediaQuery.sizeOf(context).height * 0.005,
            left: 10,
            child: customButton(
              custombuttonmodel: Custombuttonmodel(
                text: "Order Now",
                onPressed: () {},
              ),
            ),
          ),
          Positioned(
            top: 10,
            bottom: 10,
            right: 10,
            child: Container(
              width: MediaQuery.sizeOf(context).width * 0.3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: const DecorationImage(
                  image: NetworkImage(
                    "https://th.bing.com/th/id/OIP.9nl2eFOD4SKNC_FIn0bSqQHaFj?w=193&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7",
                  ),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
