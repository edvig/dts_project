import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:party_seeker/config/date.extension.dart';
import 'package:party_seeker/models/event.dart';

import 'custom_datetime_picker.dart';
import 'custom_text_field.dart';

class EventForm extends StatefulWidget {
  final bool isNewEvent;
  bool get isEdit => !isNewEvent;
  final Event? event;
  final void Function(Event event) saveEventFunction;
  final GlobalKey<FormState> formKey;
  final int? userId;

  const EventForm(
      {super.key,
      required this.isNewEvent,
      this.event,
      required this.saveEventFunction,
      required this.formKey,
      this.userId})
      : assert(
            isNewEvent && (event == null && userId != null) ||
                !isNewEvent && (event != null),
            "Or isNewEvent is true or Event is not null");

  @override
  State<EventForm> createState() => _EventFormState();
}

class _EventFormState extends State<EventForm> {
  DateTime? dateTime;
  bool isLoading = false;

  final titleController = TextEditingController();
  final dateController = TextEditingController();
  final priceController = TextEditingController();
  final localController = TextEditingController();
  final minimunAgeController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  void initState() {
    if (widget.isEdit) {
      setEditInitialValues();
    }
    super.initState();
  }

  void setEditInitialValues() {
    titleController.text = widget.event?.title ?? "";
    dateController.text = widget.event?.date.toSimpleDateAndHour() ?? "";
    dateTime = widget.event?.date;
    priceController.text = widget.event?.price.toString() ?? "";
    localController.text = widget.event?.location ?? "";
    minimunAgeController.text = widget.event?.minAgeToAttend.toString() ?? "";
    descriptionController.text = widget.event?.description ?? "";
  }

  void disposeTextEditingController() {
    titleController.dispose();
    dateController.dispose();
    priceController.dispose();
    localController.dispose();
    minimunAgeController.dispose();
    descriptionController.dispose();
  }

  @override
  void dispose() {
    disposeTextEditingController();
    super.dispose();
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

  Event getNewEvent() {
    if (widget.isNewEvent) {
      return Event(
          title: titleController.text,
          location: localController.text,
          date: dateTime!,
          minAgeToAttend: int.parse(minimunAgeController.text),
          price: priceStringToDouble(priceController.text),
          description: descriptionController.text,
          organizerId: widget.userId ?? widget.event!.organizerId);
    } else {
      widget.event!.title = titleController.text;
      widget.event!.location = localController.text;
      widget.event!.date = dateTime!;
      widget.event!.minAgeToAttend = int.parse(minimunAgeController.text);
      widget.event!.price = priceStringToDouble(priceController.text);
      widget.event!.description = descriptionController.text;
      return widget.event!;
    }
  }

  double priceStringToDouble(String value) =>
      double.parse(value.replaceAll("€", ""));

  Widget createButton() => InkWell(
        onTap: () => widget.saveEventFunction(getNewEvent()),
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
                      widget.isNewEvent ? 'Create' : "Save",
                      style: Theme.of(context)
                          .textTheme
                          .headline2
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
            ),
          ),
        ),
      );

  Widget loading() => const CupertinoActivityIndicator(
        radius: 15,
        color: Colors.white,
      );

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
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
            hintText: 'Location',
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
    );
  }
}
