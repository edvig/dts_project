import 'package:flutter/material.dart';
import 'package:party_seeker/config/routes.dart';
import 'package:party_seeker/pages/login/login.controller.dart';
import 'package:party_seeker/pages/login/login.view.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> implements LoginView {
  late LoginController controller;
  int counter = 0;
  bool loading = false;

  @override
  void initState() {
    controller = LoginController(this);
    super.initState();
  }

  @override
  void increment(int newCounter) {
    setState(() {
      counter = newCounter;
    });
  }

  @override
  void navigateTo(String route) {
    Navigator.pushNamed(context, route);
  }

  @override
  void setLoading(bool value) {
    setState(() {
      loading = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Page"),
      ),
      body: Column(
        children: [
          Center(
            child: Text(
              "This is the login page $counter",
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
          ElevatedButton(
              onPressed: controller.increment, child: const Text("Increment")),
          loading
              ? const CircularProgressIndicator()
              : ElevatedButton(
                  onPressed: () => controller.login("email", "password"),
                  child: const Text("LOGIN"))
        ],
      ),
    );
  }
}
