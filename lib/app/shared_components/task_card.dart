import 'package:fe_ezlang_flashcard/app/config/resources/colours.dart';
import 'package:fe_ezlang_flashcard/app/config/resources/dimens.dart';
import 'package:fe_ezlang_flashcard/app/config/resources/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:percent_indicator/percent_indicator.dart';

class TaskCard extends StatelessWidget {
  final String title;

  const TaskCard({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimens.lRadius)),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(Dimens.mp),
              child: _Title(title: title),
            )
          ],
        ),
      ),
    );
  }
}

class _Title extends StatelessWidget {
  final String title;
  const _Title({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color color = Colours.toColor(title);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Styles.titleText.copyWith(color: color),
        ),
        Text(
          "Created At 06/08",
          style: Styles.subtitleText,
        ),
        SizedBox(
          height: Dimens.mm,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            CircularPercentIndicator(
              radius: 45,
              progressColor: color,
              percent: 0.2,
              lineWidth: 10,
              backgroundWidth: 6,
              circularStrokeCap: CircularStrokeCap.round,
              center: Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Studied",
                      style: Styles.subtitleText,
                    ),
                    Text(
                      "0/200",
                      style: Styles.subtitleText,
                    ),
                  ],
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                primary: color,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onPressed: () {},
              child: Text(
                "Study Now",
              ),
            ),
          ],
        )
      ],
    );
  }
}
