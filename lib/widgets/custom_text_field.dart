import 'package:chat_ai/utils/constants.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    this.maxLines = 1,
    this.onSaved,
    this.onChanged,
    this.controller,
    this.onSubmitted,
    this.obscureText = false,
    this.suffixIcon,
    this.prefixIcon,
    this.focusNode,
  });
  final String hintText;
  final int maxLines;
  final void Function(String?)? onSaved;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final Function(String)? onSubmitted;
  final bool obscureText;
  final IconButton? suffixIcon;
  final FocusNode? focusNode;
  final Icon? prefixIcon;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: const LinearGradient(colors: [
            Color.fromARGB(255, 63, 63, 66),
            Color(0xff202021),
          ]),
          borderRadius: BorderRadius.circular(24)),
      child: TextFormField(
        obscureText: obscureText,
        onFieldSubmitted: onSubmitted,
        controller: controller,
        onChanged: onChanged,
        onSaved: onSaved,
        focusNode: focusNode,
        validator: (value) {
          if (value?.isEmpty ?? true) {
            return '    Field is required';
          } else {
            return null;
          }
        },
        cursorColor: kPrimaryColor,
        maxLines: maxLines,
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          suffixIcon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: suffixIcon,
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          fillColor: const Color(0xff202021),
          filled: false,
          hintText: hintText,
          hintStyle: TextStyle(
              color: Colors.white.withOpacity(0.5),
              fontWeight: FontWeight.w400),
          enabledBorder: buildBorder(),
          focusedBorder: buildBorder(kPrimaryColor),
        ),
      ),
    );
  }

  OutlineInputBorder buildBorder([color]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(24),
      borderSide:
          BorderSide(color: color ?? const Color(0xff202021).withOpacity(0.1)),
    );
  }
}
