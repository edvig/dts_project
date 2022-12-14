import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final int? maxLines;
  final TextEditingController? controller;
  final void Function()? onTap;
  final bool? enabled;
  final bool readOnly;
  final List<TextInputFormatter>? inputFormatters;

  const CustomTextField(
      {super.key,
      required this.hintText,
      this.validator,
      this.keyboardType,
      this.controller,
      this.maxLines = 1,
      this.onTap,
      this.enabled,
      this.readOnly = false,
      this.inputFormatters});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      onTap: onTap,
      enabled: enabled,
      readOnly: readOnly,
      inputFormatters: inputFormatters,
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