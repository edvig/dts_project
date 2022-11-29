import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditEventPage extends StatelessWidget {
  const EditEventPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "Edit Event",
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
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.only(
          top: 20,
          bottom: 30,
          left: 20,
          right: 20,
        ),
        children: [
          const CupertinoTextField(
            placeholder: 'Title',
          ),
          const SizedBox(height: 15),
          const CupertinoTextField(
            placeholder: 'Date',
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 15),
          const CupertinoTextField(
            placeholder: 'Time',
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 15),
          const CupertinoTextField(
            placeholder: 'Price',
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 15),
          const CupertinoTextField(
            placeholder: 'Description',
            maxLines: 10,
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 30),
          InkWell(
            onTap: () {},
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                  border: Border.all(
                    width: 3,
                    color: Colors.white,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(100))),
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Center(
                  child: false
                      ? const CupertinoActivityIndicator(
                          radius: 15,
                          color: Colors.white,
                        )
                      : Text(
                          'Save',
                          style: Theme.of(context)
                              .textTheme
                              .headline2
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
