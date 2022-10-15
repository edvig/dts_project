import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfiletPage extends StatelessWidget {
  const ProfiletPage({Key? key}) : super(key: key);

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
                const Icon(
                  CupertinoIcons.profile_circled,
                  color: Colors.white,
                  size: 100,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Matheus' + ' ' + 'Galvao',
                    style: Theme.of(context).textTheme.headline2,
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
            const SizedBox(height: 15),
            InkWell(
              onTap: () {},
              child: Container(
                width: 150,
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
                            style:
                                Theme.of(context).textTheme.headline2?.copyWith(
                                      fontWeight: FontWeight.w800,
                                      color: Colors.black,
                                    ),
                          ),
                  ),
                ),
              ),
            ),
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 18,
                itemBuilder: (context, index) {
                  return Text('Some text');
                })
          ],
        ),
      ),
    );
  }
}
