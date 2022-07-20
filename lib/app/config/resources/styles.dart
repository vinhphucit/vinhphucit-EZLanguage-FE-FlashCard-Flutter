import 'package:fe_ezlang_flashcard/app/config/resources/colours.dart';
import 'package:fe_ezlang_flashcard/app/config/resources/dimens.dart';
import 'package:flutter/material.dart';

class Styles {
  static final buttonForm = ElevatedButton.styleFrom(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(Dimens.mRadius),
    ),
    primary: Colors.black,
    minimumSize: const Size(double.infinity, 50),
  );

  static const textFormButton = TextStyle(
      color: Colours.tfText, fontSize: 18, fontWeight: FontWeight.normal);

  static const commonText = TextStyle(
    color: Colours.tfText,
    fontSize: Dimens.mts,
  );

  static const titleTextForm =
      TextStyle(fontWeight: FontWeight.bold, fontSize: Dimens.xlts);
  static var titleText =
      TextStyle(fontWeight: FontWeight.bold, fontSize: Dimens.mts);
  static var subtitleText =
      TextStyle(fontWeight: FontWeight.normal, fontSize: Dimens.sts);
}
