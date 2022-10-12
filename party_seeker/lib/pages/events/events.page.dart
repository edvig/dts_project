import 'package:flutter/material.dart';

class EventsPage extends StatefulWidget {
  const EventsPage({super.key});

  @override
  State<EventsPage> createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Event page"),
      ),
      body: Column(
        children: [
          Center(
            child: Text("This will be the event page list",
                style: Theme.of(context).textTheme.headline3),
          )
        ],
      ),
    );
  }
}
