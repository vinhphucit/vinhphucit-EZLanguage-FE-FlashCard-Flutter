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

class ResetPasswordDesktop extends StatelessWidget {
  ResetPasswordDesktop({Key? key}) : super(key: key);
  String? email, password;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: SafeArea(
        child: Stack(children: [
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: Dimens.mp, vertical: Dimens.mp),
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
          Column(
            children: [
              const SizedBox(
                height: Dimens.xxlm,
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: Dimens.lp),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(S.of(context).reset_password,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: Dimens.xlts)),
                      ),
                      const SizedBox(
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
                          const SizedBox(
                            height: Dimens.mm,
                          ),
                          FormButton(
                              text: S.of(context).confirm, callback: () {}),
                        ]),
                      ),
                    ],
                  ))
            ],
          ),
        ]),
      ),
    );
  }
}
