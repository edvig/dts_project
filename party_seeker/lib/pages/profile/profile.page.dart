import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../config/routes.dart';
import 'profile.controller.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late ProfileController controller;
  bool loading = false;

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
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Matheus' + ' ' + 'Galvao',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ),
                const SizedBox(width: 10),
                InkWell(
                  onTap: () {},
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
                    'matheusgalvao@email.com',
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
                    '03/11/2001',
                    style: Theme.of(context)
                        .textTheme
                        .headline2
                        ?.copyWith(fontSize: 20),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
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
                      Container(
                        width: MediaQuery.of(context).size.width * .5,
                        child: Text(
                          'Quiz Party',
                          overflow: TextOverflow.fade,
                          style: Theme.of(context).textTheme.headline2,
                        ),
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              navigateTo(Routes.editEvent);
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
                            onTap: () {},
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
