import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final int? maxLines;
  TextEditingController? controller;

  CustomTextField(
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
          border:
              UnderlineInputBorder(borderRadius: BorderRadius.circular(20))),
      keyboardType: keyboardType,
      maxLines: maxLines,
    );
  }
}
