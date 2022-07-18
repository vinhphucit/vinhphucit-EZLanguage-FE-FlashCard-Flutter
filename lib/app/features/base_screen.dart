import 'package:fe_ezlang_flashcard/app/config/resources/styles.dart';
import 'package:fe_ezlang_flashcard/app/repository/remotes/exceptions/http_exception.dart';
import 'package:flutter/material.dart';

abstract class BaseScreen {
  handleResponse<T>(BuildContext context, Future<T> f, [Function? next]) async {
    try {
      T t = await f;
      if (next != null) next();
      return t;
    } on HttpException catch (e) {
      buildSnackError(e.toString(), context);
    } catch (e) {
      buildSnackError(e.toString(), context);
    }
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> buildSnackError(
      String error, context) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.black,
        content: SizedBox(
          height: 30,
          child: Center(
            child: Text(
              error,
              style: Styles.commonText,
            ),
          ),
        ),
      ),
    );
  }
}
