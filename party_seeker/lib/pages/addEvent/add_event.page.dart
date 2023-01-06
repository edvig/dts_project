import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:party_seeker/components/event_form.dart';
import 'package:party_seeker/pages/addEvent/add_event.controller.dart';
import 'package:party_seeker/pages/addEvent/add_event.view.dart';
import '../../config/date.extension.dart';

import '../../components/custom_datetime_picker.dart';
import '../../models/event.dart';

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

  final _formKey = GlobalKey<FormState>();

  final titleController = TextEditingController();
  final dateController = TextEditingController();
  final priceController = TextEditingController();
  final localController = TextEditingController();
  final minimunAgeController = TextEditingController();
  final descriptionController = TextEditingController();

  DateTime? dateTime;

  void disposeTextEditingController() {
    titleController.dispose();
    dateController.dispose();
    priceController.dispose();
    localController.dispose();
    minimunAgeController.dispose();
    descriptionController.dispose();
  }

  @override
  void initState() {
    controller = AddEventController(this);
    super.initState();
  }

  @override
  void dispose() {
    disposeTextEditingController();
    super.dispose();
  }

  Widget loading() => const CupertinoActivityIndicator(
        radius: 15,
        color: Colors.white,
      );

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
  bool isFormValid() {
    return _formKey.currentState!.validate();
  }

  double priceStringToDouble(String value) =>
      double.parse(value.replaceAll("€", ""));

  @override
  Event getNewEvent() {
    return Event(
        title: titleController.text,
        location: localController.text,
        date: dateTime!,
        minAgeToAttend: int.parse(minimunAgeController.text),
        price: priceStringToDouble(priceController.text),
        description: descriptionController.text,
        organizerId: controller.userId);
  }

  String? validator(String? value) {
    if (value == null || value == "") {
      return "Please enter the information";
    }
    return null;
  }

  dateTimePickerModal() {
    showCupertinoModalPopup(
        context: context,
        builder: (_) => CustonDatetimePicker(
              modalMode: CupertinoDatePickerMode.dateAndTime,
              value: dateTime ?? DateTime.now(),
              onDateTimeChanged: (DateTime value) {
                setState(() {
                  dateTime = value;
                  dateController.text = value.toSimpleDateAndHour();
                });
              },
            ));
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
        body: EventForm(
          isNewEvent: true,
          saveEventFunction: controller.createNewEvent,
          formKey: _formKey,
          userId: controller.userId,
        ));
  }
}
