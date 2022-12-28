import 'package:flutter/material.dart';

class CustomSnackBar {
  final BuildContext context;

  CustomSnackBar.of(this.context);

  void show(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }
}
