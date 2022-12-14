import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustonDatetimePicker extends StatefulWidget {
  final void Function(DateTime) onDateTimeChanged;
  final DateTime value;

  const CustonDatetimePicker(
      {required this.onDateTimeChanged, required this.value, super.key});

  @override
  State<CustonDatetimePicker> createState() => _CustonDatetimePickerState();
}

class _CustonDatetimePickerState extends State<CustonDatetimePicker> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(color: Colors.white),
          height: MediaQuery.of(context).size.height / 2.5,
          padding: const EdgeInsets.only(top: 6.0),
          margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: SafeArea(
              child: CupertinoDatePicker(
                  initialDateTime: widget.value,
                  use24hFormat: true,
                  onDateTimeChanged: widget.onDateTimeChanged)),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white, elevation: 0),
                child: const Text(
                  "Select",
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
                onPressed: () {
                  widget.onDateTimeChanged(DateTime.now());
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
