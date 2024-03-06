import 'package:chat_ai/utils/constants.dart';
import 'package:chat_ai/utils/show_snack_bar.dart';
import 'package:chat_ai/views/chat_view.dart';
import 'package:chat_ai/widgets/custom_button.dart';
import 'package:chat_ai/widgets/custom_text_field.dart';
import 'package:chat_ai/widgets/stroke_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});
  static String id = 'Register';

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  String? email, password, name;
  bool isLoading = false;

  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: userColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
          child: Form(
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
                  hintText: 'Enter Email',
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
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
                          showSnackBar(
                              context, 'The password provided is too weak.');
                        } else if (e.code == 'email-already-in-use') {
                          showSnackBar(context,
                              'The account already exists for that email.');
                        }
                      } catch (e) {}
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
          ),
        ),
      ),
    );
  }

  Future<void> registerUser() async {
    UserCredential user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: password!);
  }
}
