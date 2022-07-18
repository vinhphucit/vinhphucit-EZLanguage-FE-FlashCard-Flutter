import 'package:fe_ezlang_flashcard/app/config/resources/styles.dart';
import 'package:flutter/material.dart';

class SnackbarUtils {
  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason>
      buildSnackbar(BuildContext context, String error) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 5),
        backgroundColor: Colors.black,
        content: Expanded(
          child: Text(
            textAlign: TextAlign.center,
            error,
            style: Styles.commonText,
          ),
        ),
      ),
    );
  }
}
