import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:party_seeker/pages/addEvent/addEvent.controller.dart';
import 'package:party_seeker/pages/addEvent/addEvent.view.dart';

class AddEventPage extends StatefulWidget {
  const AddEventPage({super.key});

  @override
  State<AddEventPage> createState() => _AddEventPageState();
}

class _AddEventPageState extends State<AddEventPage> implements AddEventView {
  late AddEventController controller;
  bool isLoading = false;
  String errorMessage = "";
  bool hasError = false;

  @override
  void initState() {
    controller = AddEventController(this);
    super.initState();
  }

  @override
  Widget loading() => const CircularProgressIndicator(color: Colors.white);

  @override
  void navigateTo(String route) {
    Navigator.pushNamed(context, route);
  }

  @override
  void setLoading(bool value) {
    setState(() {
      isLoading = value;
    });
  }

  @override
  void showErrorMessage(String message) {
    setState(() {
      hasError = true;
      errorMessage = message;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "Create Event",
          style: Theme.of(context).textTheme.headline1,
        ),
        centerTitle: true,
        leading: InkWell(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(CupertinoIcons.left_chevron),
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.only(
          top: 20,
          bottom: 30,
          left: 20,
          right: 20,
        ),
        children: [
          CupertinoTextField(
            placeholder: 'Title',
          ),
          const SizedBox(height: 15),
          CupertinoTextField(
            placeholder: 'Date',
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 15),
          CupertinoTextField(
            placeholder: 'Time',
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 15),
          CupertinoTextField(
            placeholder: 'Price',
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 15),
          CupertinoTextField(
            placeholder: 'Description',
            maxLines: 10,
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 30),
          InkWell(
            onTap: () {},
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
                  child: false
                      ? const CupertinoActivityIndicator(
                          radius: 15,
                          color: Colors.white,
                        )
                      : Text(
                          'Create',
                          style: Theme.of(context)
                              .textTheme
                              .headline2
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
