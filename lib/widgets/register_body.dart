import 'package:chat_ai/utils/constants.dart';
import 'package:chat_ai/utils/show_snack_bar.dart';
import 'package:chat_ai/views/chat_view.dart';
import 'package:chat_ai/widgets/custom_button.dart';
import 'package:chat_ai/widgets/custom_text_field.dart';
import 'package:chat_ai/widgets/snake_case.dart';
import 'package:chat_ai/widgets/stroke_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterBody extends StatefulWidget {
  const RegisterBody({super.key});

  @override
  State<RegisterBody> createState() => _RegisterBodyState();
}

class _RegisterBodyState extends State<RegisterBody> {
  String? email, password, name;
  bool isLoading = false;

  bool _obscureText = false;
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
      autovalidateMode: autovalidateMode,
      key: formKey,
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
                text: 'Register',
                style: TextStyle(
                  fontFamily: 'Carter One',
                  fontSize: 24,
                ),
              ),
            ],
          ),
          CustomTextField(
            prefixIcon: const Icon(
              Icons.person_2_outlined,
              color: kPrimaryColor,
            ),
            onChanged: (data) {
              name = data;
            },
            hintText: 'Your Name',
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
                  await registerUser();
                  Navigator.pushNamed(
                    context,
                    ChatView.id,
                    arguments: name,
                  );
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'weak-password') {
                    mySnackBar(context, 'The password provided is too weak.');
                  } else if (e.code == 'email-already-in-use') {
                    mySnackBar(
                        context, 'The account already exists for that email.');
                  }
                }
                isLoading = false;
                setState(() {});
              } else {
                autovalidateMode = AutovalidateMode.always;
                setState(() {});
              }
            },
            text: 'Sign Up',
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Already have an account?',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: kSecondaryColor,
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Sign In',
                    style: TextStyle(color: kPrimaryColor)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> registerUser() async {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: password!);
  }
}
