import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:party_seeker/config/routes.dart';
import 'package:party_seeker/pages/login/login.controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final LoginController controller;

  @override
  void initState() {
    controller = LoginController();
    super.initState();
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
              "This is the login page",
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
          Observer(
            builder: (_) => Center(
              child: Text(
                "${controller.counter}",
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ),
          ),
          ElevatedButton(
              onPressed: controller.increment,
              child: const Text("Increase count")),
          ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, Routes.events),
              child: const Text("Login and navigate to event page"))
        ],
      ),
    );
  }
}
