import 'package:fe_ezlang_flashcard/app/config/resources/dimens.dart';
import 'package:fe_ezlang_flashcard/app/config/resources/styles.dart';
import 'package:flutter/material.dart';

class FormButton extends StatelessWidget {
  String text;
  VoidCallback callback;
  bool? isLoading;
  FormButton(
      {Key? key,
      required String this.text,
      required VoidCallback this.callback,
      bool? this.isLoading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: callback,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: (isLoading ?? false)
              ? Container(
                  child: CircularProgressIndicator(),
                  width: 27,
                  height: 27,
                )
              : Text(text, style: Styles.textFormButton),
        ),
        style: Styles.buttonForm);
  }
}
