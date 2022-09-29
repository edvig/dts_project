import 'package:flutter/material.dart';
import 'package:party_seeker/config/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
          ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, Routes.events),
              child: const Text("Login and navigate to event page"))
        ],
      ),
    );
  }
}
