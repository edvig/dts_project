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
      body: Padding(
        padding: const EdgeInsets.only(
          top: 60,
          bottom: 30,
          left: 15,
          right: 15,
        ),
        child: Column(
          children: [
            Center(
              child: Text(
                "Next Events",
                style: Theme.of(context).textTheme.headline1,
              ),
            )
          ],
        ),
      ),
    );
  }
}
