import 'package:fe_ezlang_flashcard/generated/l10n.dart';
import 'package:flutter/material.dart';

class DialogUtils {
  static void showAlertDialog(BuildContext context, String content,
      String title, String content2, Function function) {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text(title),
            content: SingleChildScrollView(
              child: Text(content),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    function();
                  },
                  child: Text(S.of(context).ok))
            ],
          );
        });
  }
}
