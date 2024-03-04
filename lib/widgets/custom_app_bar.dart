import 'package:chat_ai/utils/constants.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      minimum: EdgeInsets.only(top: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Eternal Sunshine',
              style: TextStyle(
                  fontSize: 24,
                  fontFamily: 'Carter One',
                  color: kPrimaryColor)),
          Icon(
            Icons.image_search,
            color: kPrimaryColor,
          ),
        ],
      ),
    );
  }
}
