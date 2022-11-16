import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:party_seeker/models/event.dart';
import 'package:party_seeker/pages/events/event_card.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../config/routes.dart';
import 'events.controller.dart';
import 'events.view.dart';

class EventsPage extends StatefulWidget {
  const EventsPage({super.key});

  @override
  State<EventsPage> createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> implements EventsView {
  late EventsController controller;
  bool isLoading = false;
  String errorMessage = "";
  bool hasError = false;
  List<Event> events = [];

  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  void initState() {
    controller = EventsController(this);
    controller.loadEvents();
    super.initState();
  }

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
  void setEvents(List<Event> value) {
    setState(() {
      hasError = false;
      events = value;
    });
  }

  @override
  void showErrorMessage(String message) {
    setState(() {
      hasError = true;
      errorMessage = message;
    });
  }

  void _onRefresh() async {
    controller.loadEvents();
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    controller.loadEvents();
    _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: InkWell(
          onTap: () {
            navigateTo(Routes.addEvent);
          },
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          child: const Icon(
            Icons.add,
            color: Colors.white,
            size: 30,
          ),
        ),
        title: Text(
          "Next Events",
          style: Theme.of(context).textTheme.headline1,
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10, top: 2),
            child: InkWell(
              onTap: () {
                navigateTo(Routes.profile);
              },
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              child: const Icon(
                CupertinoIcons.profile_circled,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
        ],
      ),
      body: SmartRefresher(
          header: CustomHeader(
            refreshStyle: RefreshStyle.Behind,
            builder: (c, m) {
              return Container(
                alignment: Alignment.center,
                child: const CupertinoActivityIndicator(
                  radius: 15,
                  color: Colors.white,
                ),
              );
            },
          ),
          physics: const BouncingScrollPhysics(),
          controller: _refreshController,
          onRefresh: _onRefresh,
          onLoading: _onLoading,
          child: page()),
    );
  }

  Widget page() {
    if (hasError) {
      return error();
    }
    return isLoading ? loading() : loadList();
  }

  @override
  Widget loading() => const Center(
        child: CircularProgressIndicator(
          color: Colors.white,
        ),
      );

  Widget error() => Center(
        child: Text(
          errorMessage,
          style: Theme.of(context).textTheme.headline1,
        ),
      );

  Widget loadList() => ListView.separated(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.only(
          top: 20,
          bottom: 30,
          left: 20,
          right: 20,
        ),
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            height: 15,
          );
        },
        itemCount: events.length,
        itemBuilder: (_, i) => EventCard(
          event: events[i],
        ),
      );
}
