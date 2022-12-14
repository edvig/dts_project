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

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    controller = LoginController(this);
    super.initState();
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
  void showErrorMessage(String message) {
    var snackBar = SnackBar(
      content: Text(message),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.only(
          top: 60,
          bottom: 30,
          left: 15,
          right: 15,
        ),
        physics: const BouncingScrollPhysics(),
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
          CupertinoTextField(
            placeholder: 'Username',
            keyboardType: TextInputType.emailAddress,
            controller: usernameController,
          ),
          const SizedBox(height: 15),
          CupertinoTextField(
            placeholder: 'Password',
            keyboardType: TextInputType.visiblePassword,
            controller: passwordController,
          ),
          const SizedBox(height: 30),
          InkWell(
            onTap: () => controller.login(
                usernameController.text, passwordController.text),
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                  border: Border.all(
                    width: 3,
                    color: Colors.white,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(100))),
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Center(
                  child: loading
                      ? const CupertinoActivityIndicator(
                          radius: 15,
                          color: Colors.white,
                        )
                      : Text(
                          'Login',
                          style: Theme.of(context)
                              .textTheme
                              .headline2
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          Center(
            child: InkWell(
                onTap: () {
                  navigateTo(Routes.signUp);
                },
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: Text(
                  'Does not have an account? Sign Up',
                  style: Theme.of(context).textTheme.headline3,
                )),
          )
        ],
      ),
    );
  }
}
