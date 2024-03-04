import 'package:chat_ai/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomSendIcon extends StatelessWidget {
  const CustomSendIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      backgroundColor: kPrimaryColor,
      radius: 32,
      child: Center(
        child: Icon(FontAwesomeIcons.solidPaperPlane),
      ),
    );
  }
}
