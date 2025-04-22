import 'package:flutter/material.dart';

// ignore: must_be_immutable
class InputFormWidget extends StatelessWidget {
  InputFormWidget(
      {super.key,
      required this.controller,
      required this.title,
      this.iconStart,
      this.suffixIcon,
      this.validator,
      required this.obscureText});

  final TextEditingController controller;
  final String title;
  IconData? iconStart;
  Widget? suffixIcon;
  bool obscureText;
  String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      validator: validator,
      decoration: InputDecoration(
        labelText: title,
        labelStyle: const TextStyle(color: Colors.blueAccent),
        prefixIcon: Icon(iconStart, color: Colors.blueAccent),
        filled: true,
        fillColor: Colors.blue.shade50,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        suffixIcon: suffixIcon,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.white, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.blue, width: 1),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.red, width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.red, width: 2),
        ),
      ),
    );
  }
}
