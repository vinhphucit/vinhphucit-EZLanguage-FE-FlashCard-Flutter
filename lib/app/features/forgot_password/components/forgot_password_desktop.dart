import 'package:fe_ezlang_flashcard/app/config/resources/colours.dart';
import 'package:fe_ezlang_flashcard/app/config/resources/dimens.dart';
import 'package:fe_ezlang_flashcard/app/features/forgot_password/forgot_password_screen.dart';
import 'package:fe_ezlang_flashcard/app/shared_components/form_button.dart';
import 'package:fe_ezlang_flashcard/app/shared_components/form_text_field.dart';
import 'package:fe_ezlang_flashcard/app/utils/extensions/get_string_ex.dart';
import 'package:fe_ezlang_flashcard/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ForgotPasswordDesktop extends StatelessWidget {
  ForgotPasswordDesktop({Key? key}) : super(key: key);
  String? email, password;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Dimens.sp, vertical: Dimens.sp),
              child: Row(
                children: [
                  InkWell(
                    onTap: () => Navigator.of(context).pop(),
                    child: Row(children: [
                      Icon(Icons.arrow_back),
                      Padding(
                        padding: EdgeInsets.only(left: Dimens.sp),
                        child: Text(S.of(context).back),
                      )
                    ]),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: Dimens.lm,
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: Dimens.lp),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(S.of(context).reset_password,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: Dimens.xlts)),
                    ),
                    SizedBox(
                      height: Dimens.mm,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Forgot your password? That's okay, it happens to everyone!\nPlease provide your email to reset your password.",
                      ),
                    ),
                    SizedBox(
                      height: Dimens.mm,
                    ),
                    Form(
                      child: Column(children: [
                        FormTextField(
                          hintText: S.of(context).email,
                          icon: Icons.email,
                          onSaved: (value) => email = value,
                          validator: (value) {
                            if (value?.isEmpty ??
                                false || !(value ?? '').contains('@')) {
                              return S.of(context).invalid_email;
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: Dimens.mm,
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(S.of(context).reset,
                                style: TextStyle(
                                    color: Colours.tf_text,
                                    fontSize: 18,
                                    fontWeight: FontWeight.normal)),
                          ),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(Dimens.m_radius),
                            ),
                            primary: Colors.black,
                            minimumSize: Size(size.width, 50),
                          ),
                        ),
                      ]),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
