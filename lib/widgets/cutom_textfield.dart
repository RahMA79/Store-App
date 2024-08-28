import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CutomTextField extends StatelessWidget {
  CutomTextField(
      {super.key,
      this.hintText,
      required this.labelText,
      this.obscureText = false,
      this.suffixIcon,
      this.controller,
      this.prefixIcon,
      this.onChanged});
  final String? hintText;
  final String labelText;
  bool obscureText;
  Function(String)? onChanged;

  Icon? prefixIcon;
  GestureDetector? suffixIcon;
  TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      onChanged: onChanged,
      decoration: InputDecoration(
          prefixIcon: prefixIcon,
          suffix: suffixIcon,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: Color(0xff375A64),
              )),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xff375A64), width: 2)),
          hintText: hintText,
          hintStyle:
              TextStyle(color: Colors.grey[600], fontFamily: 'Montserrat'),
          labelText: labelText,
          labelStyle:
              TextStyle(color: Colors.grey[800], fontFamily: 'Montserrat'),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 20, horizontal: 16)),
    );
  }
}
