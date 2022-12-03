import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final int? maxLines;
  final TextEditingController? controller;

  const CustomTextField(
      {super.key,
      required this.hintText,
      this.validator,
      this.keyboardType,
      this.controller,
      this.maxLines = 1});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
          hintText: hintText,
          filled: true,
          fillColor: Colors.white,
          border: UnderlineInputBorder(borderRadius: BorderRadius.circular(5))),
      keyboardType: keyboardType,
      maxLines: maxLines,
    );
  }
}
