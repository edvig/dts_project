import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:party_seeker/pages/events/EventCard.dart';
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
  bool loading = false;
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  void navigateTo(String route) {
    Navigator.pushNamed(context, route);
  }

  @override
  void setLoading(bool value) {
    setState(() {
      loading = value;
    });
  }

  void _onRefresh() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    await Future.delayed(Duration(milliseconds: 1000));

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
              child: CupertinoActivityIndicator(
                radius: 15,
                color: Colors.white,
              ),
              alignment: Alignment.center,
            );
          },
        ),
        physics: const BouncingScrollPhysics(),
        controller: _refreshController,
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        child: ListView.separated(
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
          itemCount: 10,
          itemBuilder: (_, i) => EventCard(),
        ),
      ),
    );
  }
}
