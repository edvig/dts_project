import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:party_seeker/pages/sign_up/sign_up.controller.dart';

import '../../config/routes.dart';
import 'sign_up.view.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> implements SignUpView {
  late SignUpController controller;
  bool loading = false;

  @override
  void initState() {
    controller = SignUpController(this);
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
              "Sign Up",
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          const SizedBox(height: 30),
          CupertinoTextField(
            placeholder: 'Email',
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 15),
          CupertinoTextField(
            placeholder: 'First Name',
            keyboardType: TextInputType.name,
          ),
          const SizedBox(height: 15),
          CupertinoTextField(
            placeholder: 'Last Name',
            keyboardType: TextInputType.name,
          ),
          const SizedBox(height: 15),
          CupertinoTextField(
            placeholder: 'Birthday',
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 15),
          CupertinoTextField(
            placeholder: 'Password',
            keyboardType: TextInputType.visiblePassword,
          ),
          const SizedBox(height: 30),
          InkWell(
            onTap: () => controller.login("email", "password"),
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
                          radius: 10,
                          color: Colors.white,
                        )
                      : Text(
                          'Create an account',
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
                  navigateTo(Routes.login);
                },
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: Text(
                  'Already have an account? Sign In',
                  style: Theme.of(context).textTheme.headline3,
                )),
          )
        ],
      ),
    );
  }
}
