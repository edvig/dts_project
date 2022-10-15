import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  const EventCard({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => showModalBottomSheet(
        context: context,
        elevation: 0,
        isScrollControlled: true,
        barrierColor: Colors.white.withOpacity(.2),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        builder: (context) => Container(
          height: MediaQuery.of(context).size.height * .8,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            color: Colors.black,
          ),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        'Quiz Party',
                        style: Theme.of(context).textTheme.headline1?.copyWith(
                              fontWeight: FontWeight.w800,
                            ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    InkWell(
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
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline1
                                      ?.copyWith(
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
                const SizedBox(height: 20),
                Row(
                  children: [
                    Text(
                      'Description:',
                      style: Theme.of(context).textTheme.headline2?.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Create your team of 5 people and be ready to play a trivia game about history, geography, music and moreCreate your team of 5 people and be ready to play a trivia game about history, geography, music and moreCreate your team of 5 people and be ready to play a trivia gameCreate your team of 5 people and be ready to play a trivia game about history, geography, music and moreCreate your team of 5 people and be ready to play a trivia game about history, geography, music and more about history, geography, music and moreCreate your team of 5 people and be ready to play a trivia game about history, geography, music and more',
                        style: Theme.of(context).textTheme.headline3,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      child: Container(
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
                bottom: 0,
                right: 0,
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
                              style: Theme.of(context)
                                  .textTheme
                                  .headline1
                                  ?.copyWith(
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
      ),
    );
  }
}
