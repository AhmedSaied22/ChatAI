import 'package:chat_ai/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ChatAppBar extends StatelessWidget {
  const ChatAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    String name = ModalRoute.of(context)!.settings.arguments as String;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        Row(
          children: [
            const Icon(
              FontAwesomeIcons.solidCircleUser,
              color: kPrimaryColor,
              size: 45,
            ),
            const SizedBox(
              width: 8,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Hello, Let\'s talk!',
                    style: TextStyle(
                        fontSize: 10, color: kPrimaryColor.withOpacity(0.6))),
                Text(name,
                    style: TextStyle(
                        fontSize: 14, color: Colors.white.withOpacity(0.8))),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
