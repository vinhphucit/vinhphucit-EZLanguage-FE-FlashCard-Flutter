import 'package:fe_ezlang_flashcard/app/repository/remotes/exceptions/http_exception.dart';
import 'package:fe_ezlang_flashcard/app/utils/dialog_utils.dart';
import 'package:fe_ezlang_flashcard/app/utils/snackbar_utils.dart';
import 'package:flutter/material.dart';

abstract class BaseScreen {
  handleResponse<T>(BuildContext context, Future<T> f, [Function? next]) async {
    try {
      T t = await f;
      if (next != null) next();
      return t;
    } on HttpException catch (e) {
      showSnackBar(e.toString(), context);
    } catch (e) {
      showSnackBar(e.toString(), context);
    }
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar(
      String error, BuildContext context) {
    return SnackbarUtils.buildSnackbar(context, error);
  }

  void showAlertDialog(BuildContext context, String title, String content,
      VoidCallback function) {
    DialogUtils.showAlertDialog(context, content, title, content, function);
  }
}
