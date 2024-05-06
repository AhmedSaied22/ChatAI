import 'package:chat_ai/utils/constants.dart';
import 'package:chat_ai/utils/show_snack_bar.dart';
import 'package:chat_ai/views/chat_view.dart';
import 'package:chat_ai/views/register_view.dart';
import 'package:chat_ai/widgets/custom_button.dart';
import 'package:chat_ai/widgets/custom_text_field.dart';
import 'package:chat_ai/widgets/snake_case.dart';
import 'package:chat_ai/widgets/stroke_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  String? email, password;

  bool isLoading = false;
  bool _obscureText = true;
  final passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final textFieldFocusNode = FocusNode();

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
      if (textFieldFocusNode.hasPrimaryFocus) {
        return; // If focus is on text field, dont unfocus
      }
      textFieldFocusNode.canRequestFocus =
          false; // Prevents focus if tap on eye
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
        child: ListView(
          children: [
            const SizedBox(
              height: 100,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedText(
                  textColor: kPrimaryColor,
                  strokeColor: kSecondaryColor,
                  strokeWidth: 0.4,
                  text: 'Eternal Sunshine AI',
                  style: TextStyle(
                    fontFamily: 'Carter One',
                    fontSize: 32,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Image.asset(
              kLogoApp,
              height: 220,
            ),
            const SizedBox(
              height: 10,
            ),
            const Row(
              children: [
                OutlinedText(
                  textColor: kSecondaryColor,
                  strokeColor: Colors.white,
                  strokeWidth: 0.2,
                  text: 'Login',
                  style: TextStyle(
                    fontFamily: 'Carter One',
                    fontSize: 24,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextField(
              onChanged: (data) {
                email = data;
              },
              prefixIcon: const Icon(
                Icons.email_outlined,
                color: kPrimaryColor,
              ),
              hintText: 'Enter Email',
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextField(
              focusNode: textFieldFocusNode,
              controller: passwordController,
              prefixIcon: const Icon(
                Icons.lock_outlined,
                color: kPrimaryColor,
              ),
              obscureText: _obscureText,
              suffixIcon: IconButton(
                  onPressed: _toggle,
                  icon: Icon(
                    _obscureText
                        ? Icons.visibility_rounded
                        : Icons.visibility_off_rounded,
                    color: kPrimaryColor,
                  )),
              onChanged: (data) {
                password = data;
              },
              hintText: 'Enter Password',
            ),
            const SizedBox(
              height: 15,
            ),
            CustomButton(
              onPressed: () async {
                if (formKey.currentState!.validate()) {
                  isLoading = true;
                  setState(() {});
                  try {
                    await loginUser();
                    Navigator.pushNamed(context, ChatView.id, arguments: email);
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'user-not-found') {
                      mySnackBar(context, 'user not found');
                    } else if (e.code == 'wrong-password') {
                      mySnackBar(context, 'wrong password');
                    }
                  } catch (e) {
                    print(Easing.legacy);
                    showSnackBar(context, 'there was an error');
                  }
                  isLoading = false;
                  setState(() {});
                } else {
                  autovalidateMode = AutovalidateMode.always;
                  setState(() {});
                }
              },
              text: 'Sign In',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Don\'t have an account?',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: kSecondaryColor,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      RegisterView.id,
                    );
                  },
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(color: kPrimaryColor),
                  ),
                ),
              ],
            ),
          ],
        ));
  }

  Future<void> loginUser() async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!);
  }
}
