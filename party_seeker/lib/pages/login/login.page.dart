import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
      body: Padding(
        padding: const EdgeInsets.only(
          top: 60,
          bottom: 30,
          left: 15,
          right: 15,
        ),
        child: ListView(
          children: [
            SvgPicture.asset(
              'lib/assets/logo/logo.svg',
              height: 150,
              color: Colors.white,
            ),
            Center(
              child: Text(
                "Sign In",
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            const SizedBox(height: 30),
            CupertinoTextField(),
            const SizedBox(height: 15),
            CupertinoTextField(),
            const SizedBox(height: 30),
            loading
                ? const CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: () => controller.login("email", "password"),
                    child: const Text("LOGIN"))
          ],
        ),
      ),
    );
  }
}
