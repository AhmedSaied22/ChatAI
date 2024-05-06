import 'package:chat_ai/utils/constants.dart';
import 'package:flutter/material.dart';

void mySnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: const Duration(milliseconds: 700),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 50,
        right: 50,
      ),
      backgroundColor: kPrimaryColor,
      content: Center(
          child: Text(
        text,
        style: const TextStyle(color: Colors.black, fontSize: 16),
      )),
    ),
  );
}
