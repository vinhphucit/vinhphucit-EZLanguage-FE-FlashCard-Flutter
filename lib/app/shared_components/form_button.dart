import 'package:fe_ezlang_flashcard/app/config/resources/styles.dart';
import 'package:flutter/material.dart';

class FormButton extends StatelessWidget {
  String text;
  VoidCallback callback;
  bool? isLoading;
  FormButton(
      {Key? key, required this.text, required this.callback, this.isLoading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: callback,
        style: Styles.buttonForm,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: (isLoading ?? false)
              ? const SizedBox(
                  width: 27,
                  height: 27,
                  child: CircularProgressIndicator(),
                )
              : Text(text, style: Styles.textFormButton),
        ));
  }
}
