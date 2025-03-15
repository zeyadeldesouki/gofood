import 'package:flutter/material.dart';

class customAppBar extends StatelessWidget {
  const customAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.arrow_back, color: Colors.black),
            ),
          ),
          InkWell(
            onTap: () {},
            child: const CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.favorite, color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}
