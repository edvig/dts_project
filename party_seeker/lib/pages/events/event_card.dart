import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:party_seeker/models/event.dart';
import '../../config/date.extension.dart';

class EventCard extends StatefulWidget {
  const EventCard({super.key, required this.event, required this.attendEvent});
  final Event event;
  final Future<void> Function(int eventId) attendEvent;

  @override
  State<EventCard> createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
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
                        widget.event.title,
                        style: Theme.of(context).textTheme.headline1?.copyWith(
                              fontWeight: FontWeight.w800,
                            ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    InkWell(
                      onTap: () => widget.attendEvent(widget.event.id ?? 0),
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
                                borderRadius: const BorderRadius.all(
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
                      widget.event.location ?? "-",
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
                      widget.event.date.toSimpleDateString(),
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
                      widget.event.date.toFormatedHour(),
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
                    SvgPicture.asset(
                      'lib/assets/icons/user_check.svg',
                      height: 30,
                      color: Colors.white,
                    ),
                    Text(
                      "${widget.event.minAgeToAttend}",
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
                    Text(
                      "€${widget.event.formatedCost}",
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
                        widget.event.description,
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
                  onTap: () => widget.attendEvent(widget.event.id ?? 0),
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
                            borderRadius: const BorderRadius.all(
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
                          child: Center(
                            child: SvgPicture.asset(
                              'lib/assets/icons/check_bold.svg',
                              height: 60,
                              color: Colors.black,
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
                        widget.event.title,
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
                            "€${widget.event.formatedCost}",
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
                        widget.event.location ?? "-",
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
                        widget.event.date.toSimpleDateString(),
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
                        widget.event.date.toFormatedHour(),
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
                      SvgPicture.asset(
                        'lib/assets/icons/user_check.svg',
                        height: 30,
                        color: Colors.white,
                      ),
                      Text(
                        "${widget.event.minAgeToAttend}",
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
