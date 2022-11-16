import 'package:flutter/material.dart';

abstract class BaseView {
  void navigateTo(String route);
  void setLoading(bool value);
  void showErrorMessage(String message);
  Widget loading();
}
