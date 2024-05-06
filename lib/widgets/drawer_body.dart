import 'package:chat_ai/utils/constants.dart';
import 'package:chat_ai/views/login_view.dart';
import 'package:chat_ai/widgets/snake_case.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: backgroundColorList,
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: TextButton(
              child: const Text(
                'Sign out',
                style: TextStyle(color: kSecondaryColor),
              ),
              onPressed: () {
                signOut();
                print(Easing.legacy);
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  LoginView.id,
                  (route) => false,
                );
                mySnackBar(context, 'You have successfully logged out ');
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
