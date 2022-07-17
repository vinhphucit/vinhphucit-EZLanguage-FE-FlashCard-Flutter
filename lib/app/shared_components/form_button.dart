import 'package:fe_ezlang_flashcard/app/config/resources/dimens.dart';
import 'package:flutter/material.dart';

class FormButton extends StatelessWidget {
  final String text;
  final List<Color> backColor;

  final List<Color> textColor;
  final GestureTapCallback onPressed;

  const FormButton({
    Key? key,
    required this.text,
    required this.backColor,
    required this.textColor,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Shader textGradient = LinearGradient(
      colors: <Color>[textColor[0], textColor[1]],
    ).createShader(
      const Rect.fromLTWH(
        0.0,
        0.0,
        200.0,
        70.0,
      ),
    );
    var size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.06,
      child: InkWell(
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimens.m_radius),
            gradient: LinearGradient(
              stops: const [0.4, 2],
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
              colors: backColor,
            ),
          ),
          child: Align(
            child: Text(
              text,
              style: TextStyle(
                foreground: Paint()..shader = textGradient,
                fontWeight: FontWeight.bold,
                fontSize: size.height * 0.02,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
