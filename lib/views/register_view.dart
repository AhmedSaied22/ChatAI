import 'package:chat_ai/utils/constants.dart';
import 'package:chat_ai/widgets/register_body.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});
  static String id = 'Register';

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
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
          child: RegisterBody(),
        ),
      ),
    );
  }
}
