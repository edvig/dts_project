import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:party_seeker/components/custom_snackbar.dart';
import 'package:party_seeker/config/date.extension.dart';
import 'package:party_seeker/models/event.dart';
import 'package:party_seeker/pages/profile/profile.view.dart';
import '../../config/routes.dart';
import 'profile.controller.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> implements ProfileView {
  late ProfileController controller;
  bool loading = false;

  @override
  void initState() {
    controller = ProfileController(this);
    super.initState();
  }

  @override
  void navigateTo(String route, {bool removeUntil = false, dynamic arguments}) {
    if (removeUntil) {
      Navigator.pushNamedAndRemoveUntil(context, route, (route) => false);
    } else {
      Navigator.pushNamed(context, route, arguments: arguments);
    }
  }

  @override
  void setLoading(bool value) {
    setState(() {
      loading = value;
    });
  }

  @override
  void showErrorMessage(String message) =>
      CustomSnackBar.of(context).show(message);

  void showDeleteConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Are you sure?',
            style: Theme.of(context).textTheme.headline2?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 25,
            vertical: 15,
          ),
          content: SizedBox(
            height: 60,
            child: Text(
              'This event will be deleted forever',
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
            side: BorderSide(
              color: Colors.white,
              width: 3,
            ),
          ),
          backgroundColor: Theme.of(context).colorScheme.background,
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                bottom: 10,
                left: 10,
                right: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: Container(
                      width: 100,
                      height: 50,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Center(
                          child: Text(
                            'No',
                            style:
                                Theme.of(context).textTheme.headline2?.copyWith(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 18,
                                      color: Colors.black,
                                    ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: Container(
                      width: 100,
                      height: 50,
                      decoration: const BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Center(
                          child: false
                              ? const CupertinoActivityIndicator(
                                  radius: 15,
                                  color: Colors.black,
                                )
                              : Text(
                                  'Yes',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline2
                                      ?.copyWith(
                                        fontWeight: FontWeight.w800,
                                        fontSize: 18,
                                        color: Colors.black,
                                      ),
                                ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Widget userInfo() => Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  controller.user.firstName ?? "Name",
                  style: Theme.of(context).textTheme.headline2,
                ),
              ),
              const SizedBox(width: 10),
              InkWell(
                onTap: () => controller.logout(),
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: Container(
                  width: 100,
                  height: 50,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Center(
                      child: false
                          ? const CupertinoActivityIndicator(
                              radius: 15,
                              color: Colors.black,
                            )
                          : Text(
                              'Log out',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline2
                                  ?.copyWith(
                                    fontWeight: FontWeight.w800,
                                    fontSize: 18,
                                    color: Colors.black,
                                  ),
                            ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const Icon(
                Icons.email_rounded,
                color: Colors.white,
                size: 25,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  controller.user.emailAddress ?? "Email address",
                  style: Theme.of(context)
                      .textTheme
                      .headline2
                      ?.copyWith(fontSize: 20),
                ),
              ),
            ],
          ),
          Row(
            children: [
              const Icon(
                Icons.calendar_month,
                color: Colors.white,
                size: 25,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  controller.user.birthday?.toSimpleDateString() ?? "birthday",
                  style: Theme.of(context)
                      .textTheme
                      .headline2
                      ?.copyWith(fontSize: 20),
                ),
              ),
            ],
          ),
        ],
      );

  Widget eventContainer(Event event) => Container(
        height: 60,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white,
            width: 3,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * .5,
              child: Text(
                event.title,
                overflow: TextOverflow.fade,
                style: Theme.of(context).textTheme.headline2,
              ),
            ),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    navigateTo(Routes.editEvent, arguments: event);
                  },
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  child: const Icon(
                    Icons.edit,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: showDeleteConfirmationDialog,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  child: const Icon(
                    CupertinoIcons.delete,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "Your Profile",
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(
          top: 20,
          bottom: 30,
          left: 20,
          right: 20,
        ),
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: <Widget>[
            userInfo(),
            const SizedBox(height: 30),
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: controller.userEventsLength,
              itemBuilder: (context, index) {
                return eventContainer(controller.userEvents[index]);
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  height: 15,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
