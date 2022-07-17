import 'package:fe_ezlang_flashcard/app/config/resources/colours.dart';
import 'package:fe_ezlang_flashcard/app/config/resources/dimens.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData get basic {
    var theme = ThemeData(
      brightness: Brightness.dark,
      textTheme: GoogleFonts.poppinsTextTheme(
        ThemeData(
            brightness: Brightness.dark,
            elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
              onPrimary: Colours.tf_text,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(Dimens.m_radius),
              ),
              primary: Colors.black,
              textStyle: TextStyle(
                  fontSize: Dimens.lts, fontWeight: FontWeight.normal),
            ))).textTheme, //dark or white depends on usuage
      ),
    );
    return theme;
  }
}
