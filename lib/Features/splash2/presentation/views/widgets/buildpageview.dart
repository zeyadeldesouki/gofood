import 'package:flutter/material.dart';
import 'package:gofood/Core/appStyles.dart';
import 'package:gofood/Features/splash2/data/pageViewModel.dart';

class Buildpageview extends StatefulWidget {
  const Buildpageview({super.key});

  @override
  State<Buildpageview> createState() => _BuildpageviewState();
}

class _BuildpageviewState extends State<Buildpageview> {
  int currentindex = 0;
  final List<Pageviewmodel> imagelist = [
    Pageviewmodel(
      image:
          'assets/images/cute_chef_girl_in_uniform_character_holding_a_turner_food_restaurant_logo_cartoon_art_illustration.jpg',
      description: "description",
    ),
    Pageviewmodel(
      image:
          'assets/images/cute_chef_girl_in_uniform_character_holding_a_turner_food_restaurant_logo_cartoon_art_illustration.jpg',
      description: "2",
    ),
    Pageviewmodel(
      image:
          'assets/images/cute_chef_girl_in_uniform_character_holding_a_turner_food_restaurant_logo_cartoon_art_illustration.jpg',
      description: "description",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.5,
          child: PageView.builder(
            onPageChanged: (value) {
              setState(() {
                currentindex = value;
              });
            },
            itemCount: imagelist.length,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(imagelist[index].image),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(imagelist.length, (index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: currentindex == index ? Colors.orange : Colors.grey,
                ),
              ),
            );
          }),
        ),
        Text(
          imagelist[currentindex].description,
          style: AppStyles.text20(context),
        ),
      ],
    );
  }
}
