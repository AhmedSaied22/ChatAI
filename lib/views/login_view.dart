import 'package:chat_ai/utils/constants.dart';
import 'package:chat_ai/widgets/login_body.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});
  static String id = 'login View';

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: const Scaffold(
        backgroundColor: userColor,
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 15,
          ),
          child: LoginBody(),
        ),
      ),
    );
  }
}
