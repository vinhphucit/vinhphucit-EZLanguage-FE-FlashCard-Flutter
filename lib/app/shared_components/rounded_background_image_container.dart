import 'package:fe_ezlang_flashcard/app/config/resources/dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class RoundedBackgroundImageContainer extends StatelessWidget {
  Widget child;
  String? backgroundImageUrl;
  Color? color;
  GestureTapCallback? onTap;
  RoundedBackgroundImageContainer(
      {Key? key,
      required this.child,
      this.backgroundImageUrl,
      this.color,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimens.lRadius)),
      child: InkWell(
        borderRadius: BorderRadius.circular(Dimens.lRadius),
        onTap: onTap,
        child: Center(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Dimens.lp),
          child: Stack(children: [child]),
        )),
      ),
    );
  }
}
