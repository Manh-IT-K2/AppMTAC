import 'package:flutter/material.dart';
import 'package:mtac/themes/color.dart';

// ignore: must_be_immutable
class InputFormWidget extends StatelessWidget {
  InputFormWidget(
      {super.key,
      required this.controller,
      required this.title,
      this.iconStart,
      this.suffixIcon,
      this.validator,
      this.onChanged,
      required this.obscureText});

  final TextEditingController controller;
  final String title;
  IconData? iconStart;
  Widget? suffixIcon;
  bool obscureText;
  String? Function(String?)? validator;
  Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      validator: validator,
      onChanged: onChanged,
      cursorColor: kPrimaryColor.withOpacity(0.5),
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
