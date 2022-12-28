import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:party_seeker/pages/addEvent/add_event.controller.dart';
import 'package:party_seeker/pages/addEvent/add_event.view.dart';
import '../../config/date.extension.dart';

import '../../components/custom_datetime_picker.dart';
import '../../components/custom_text_field.dart';
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
        // TODO: get organizer Id from shared preferences after implement login
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
      body: Form(
        key: _formKey,
        child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.only(
            top: 20,
            bottom: 30,
            left: 20,
            right: 20,
          ),
          children: [
            CustomTextField(
              hintText: 'Title',
              validator: validator,
              controller: titleController,
            ),
            const SizedBox(height: 15),
            Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              child: CustomTextField(
                hintText: "Date and hour",
                controller: dateController,
                onTap: dateTimePickerModal,
                readOnly: true,
                validator: validator,
              ),
            ),
            const SizedBox(height: 15),
            CustomTextField(
              hintText: 'Price',
              keyboardType: TextInputType.number,
              controller: priceController,
              validator: validator,
              inputFormatters: [
                CurrencyTextInputFormatter(symbol: "€", enableNegative: false)
              ],
            ),
            const SizedBox(height: 15),
            CustomTextField(
              hintText: 'Local',
              keyboardType: TextInputType.text,
              controller: localController,
              validator: validator,
            ),
            const SizedBox(height: 15),
            CustomTextField(
              hintText: 'Minimum age',
              keyboardType: TextInputType.number,
              controller: minimunAgeController,
              validator: validator,
            ),
            const SizedBox(height: 15),
            CustomTextField(
              hintText: 'Description',
              maxLines: 10,
              keyboardType: TextInputType.text,
              controller: descriptionController,
              validator: validator,
            ),
            const SizedBox(height: 30),
            createButton()
          ],
        ),
      ),
    );
  }

  Widget createButton() => InkWell(
        onTap: controller.createNewEvent,
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
              child: isLoading
                  ? loading()
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
      );
}
