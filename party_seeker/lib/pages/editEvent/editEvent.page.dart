import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:party_seeker/components/custom_snackbar.dart';
import 'package:party_seeker/pages/editEvent/editEvent.controller.dart';
import 'package:party_seeker/pages/editEvent/editEvent.view.dart';
import '../../components/event_form.dart';
import '../../models/event.dart';

class EditEventPage extends StatefulWidget {
  const EditEventPage({super.key});

  @override
  State<EditEventPage> createState() => _EditEventPageState();
}

class _EditEventPageState extends State<EditEventPage>
    implements EditEventView {
  late Event event;
  late EditEventController controller;
  bool isLoading = false;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    controller = EditEventController(this);
    super.initState();
  }

  @override
  void navigateBack() => Navigator.pop(context);

  @override
  void navigateTo(String route) {
    Navigator.pushNamed(context, route);
  }

  @override
  void setLoading(bool value) => isLoading = value;

  @override
  void showErrorMessage(String message) {
    CustomSnackBar.of(context).show(message);
  }

  @override
  Widget build(BuildContext context) {
    event = ModalRoute.of(context)!.settings.arguments as Event;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "Edit Event",
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
          event: event,
          isNewEvent: false,
          saveEventFunction: controller.saveEvent,
          formKey: _formKey),
    );
  }
}
