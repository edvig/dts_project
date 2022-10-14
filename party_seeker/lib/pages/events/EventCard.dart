import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  const EventCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      decoration: BoxDecoration(
          border: Border.all(
            width: 3,
            color: Colors.white,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(30))),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Quiz Party',
                  style: Theme.of(context).textTheme.headline1,
                ),
                Container(
                  height: 50,
                  width: 90,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(100),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      '1' + '€',
                      style: Theme.of(context).textTheme.headline2?.copyWith(
                            color: Colors.black,
                          ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
