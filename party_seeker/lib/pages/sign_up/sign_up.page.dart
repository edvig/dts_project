import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:party_seeker/components/custom_datetime_picker.dart';
import 'package:party_seeker/components/custom_snackbar.dart';
import 'package:party_seeker/components/custom_text_field.dart';
import 'package:party_seeker/models/user.dart';
import 'package:party_seeker/pages/sign_up/sign_up.controller.dart';
import 'package:party_seeker/config/date.extension.dart';
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

  late DateTime userDateTime;

  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final birthdayController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    controller = SignUpController(this);
    super.initState();
  }

  @override
  void navigateTo(String route) {
    Navigator.pushNamedAndRemoveUntil(
        context, route, (Route<dynamic> route) => false);
  }

  @override
  void setLoading(bool value) {
    setState(() {
      loading = value;
    });
  }

  @override
  void showErrorMessage(String message) {
    CustomSnackBar.of(context).show(message);
  }

  @override
  bool isFormValid() => _formKey.currentState!.validate();

  @override
  User getUser() => User(
      emailAddress: emailController.text,
      firstName: firstNameController.text,
      lastName: lastNameController.text,
      birthday: userDateTime,
      username: usernameController.text,
      password: passwordController.text);

  //TODO create component
  dateTimerPickModal() {
    showCupertinoModalPopup(
      context: context,
      builder: (_) => CustonDatetimePicker(
          modalMode: CupertinoDatePickerMode.date,
          onDateTimeChanged: (dateTime) {
            birthdayController.text = dateTime.toSimpleDateString();
            userDateTime = dateTime;
          },
          value: DateTime.now()),
    );
  }

  //TODO create mixin
  String? validator(String? value) {
    if (value == null || value == "") {
      return "Please enter the information";
    }
    return null;
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
          Form(
            key: _formKey,
            child: Column(
              children: [
                CustomTextField(
                  hintText: 'Email',
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                ),
                const SizedBox(height: 15),
                CustomTextField(
                  hintText: 'First Name',
                  keyboardType: TextInputType.name,
                  controller: firstNameController,
                ),
                const SizedBox(height: 15),
                CustomTextField(
                  hintText: 'Last Name',
                  keyboardType: TextInputType.name,
                  controller: lastNameController,
                ),
                const SizedBox(height: 15),
                Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: CustomTextField(
                    hintText: "Birthday",
                    controller: birthdayController,
                    readOnly: true,
                    onTap: dateTimerPickModal,
                  ),
                ),
                const SizedBox(height: 15),
                CustomTextField(
                  hintText: 'Username',
                  keyboardType: TextInputType.visiblePassword,
                  controller: usernameController,
                ),
                const SizedBox(height: 15),
                CustomTextField(
                  hintText: 'Password',
                  keyboardType: TextInputType.visiblePassword,
                  controller: passwordController,
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          InkWell(
            onTap: () => controller.signup(),
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
