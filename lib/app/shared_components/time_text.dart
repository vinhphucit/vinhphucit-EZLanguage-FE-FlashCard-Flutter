import 'dart:async';

import 'package:fe_ezlang_flashcard/app/config/resources/dimens.dart';
import 'package:fe_ezlang_flashcard/app/config/resources/styles.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimeText extends StatefulWidget {
  const TimeText({Key? key}) : super(key: key);

  @override
  State<TimeText> createState() => _TimeTextState();
}

class _TimeTextState extends State<TimeText> {
  late Timer _timer;
  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            DateFormat.yMMMEd().format(DateTime.now()),
            style: Styles.commonText.copyWith(fontSize: Dimens.sts),
          ),
          Text(
            DateFormat.Hms().format(DateTime.now()),
            style: Styles.titleTextForm.copyWith(fontSize: Dimens.lts),
          )
        ],
      ),
    );
  }
}
