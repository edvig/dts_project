import 'package:flutter/cupertino.dart';
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
        child: Stack(
          children: [
            Positioned(
              bottom: 5,
              right: 5,
              child: InkWell(
                onTap: () {},
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                child: true
                    ? Container(
                        height: 90,
                        width: 110,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 5,
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(100),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Go',
                            style:
                                Theme.of(context).textTheme.headline1?.copyWith(
                                      color: Colors.white,
                                      fontSize: 50,
                                      fontWeight: FontWeight.w800,
                                    ),
                          ),
                        ),
                      )
                    : Container(
                        height: 90,
                        width: 110,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(100),
                          ),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.check,
                            size: 50,
                          ),
                        ),
                      ),
              ),
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Quiz Party',
                      style: Theme.of(context).textTheme.headline1?.copyWith(
                            fontWeight: FontWeight.w800,
                          ),
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
                          style:
                              Theme.of(context).textTheme.headline2?.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w900,
                                  ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.location_on,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      'Kopus Bar',
                      style: Theme.of(context)
                          .textTheme
                          .headline3
                          ?.copyWith(fontSize: 20),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.calendar_month,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      '24/09/2022',
                      style: Theme.of(context)
                          .textTheme
                          .headline3
                          ?.copyWith(fontSize: 20),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.access_time,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      '22:00',
                      style: Theme.of(context)
                          .textTheme
                          .headline3
                          ?.copyWith(fontSize: 20),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      CupertinoIcons.person_2_fill,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      '13',
                      style: Theme.of(context)
                          .textTheme
                          .headline3
                          ?.copyWith(fontSize: 20),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
