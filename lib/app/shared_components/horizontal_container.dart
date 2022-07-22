import 'package:fe_ezlang_flashcard/app/config/resources/colours.dart';
import 'package:fe_ezlang_flashcard/app/config/resources/dimens.dart';
import 'package:fe_ezlang_flashcard/app/config/resources/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class HorizontalContainer extends StatelessWidget {
  String title;
  Widget child;
  HorizontalContainer({Key? key, required this.title, required this.child})
      : super(key: key);

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
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [_Title(title: title), child],
                ),
              ),
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
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Styles.titleText.copyWith(color: color),
        ),
        TextButton(onPressed: () {}, child: Text("View more"))
      ],
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: Dimens.mm,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [],
        )
      ],
    );
  }
}
