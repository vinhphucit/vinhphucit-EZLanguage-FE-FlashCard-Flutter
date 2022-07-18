import 'package:fe_ezlang_flashcard/app/config/resources/colours.dart';
import 'package:fe_ezlang_flashcard/app/config/resources/dimens.dart';
import 'package:fe_ezlang_flashcard/app/config/resources/styles.dart';
import 'package:fe_ezlang_flashcard/app/shared_components/form_button.dart';
import 'package:fe_ezlang_flashcard/app/shared_components/form_text_field.dart';
import 'package:fe_ezlang_flashcard/generated/l10n.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignUpDesktop extends StatefulWidget {
  bool? checkedValue;
  String? email, password, firstName, lastName;
  SignUpDesktop(
      {Key? key,
      bool? this.checkedValue,
      String? this.email,
      String? this.password,
      String? this.firstName,
      String? this.lastName})
      : super(key: key);

  @override
  State<SignUpDesktop> createState() => _SignUpDesktopState();
}

class _SignUpDesktopState extends State<SignUpDesktop> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: Dimens.mp, vertical: Dimens.mp),
              child: Row(
                children: [
                  InkWell(
                    onTap: () => Navigator.of(context).pop(),
                    child: Row(children: [
                      const Icon(Icons.arrow_back),
                      Padding(
                        padding: const EdgeInsets.only(left: Dimens.sp),
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
                  height: Dimens.lm,
                ),
                Text(
                  S.of(context).hey_there,
                  style: const TextStyle(fontSize: Dimens.lts),
                ),
                const SizedBox(
                  height: Dimens.sm,
                ),
                Align(
                  child: Text(S.of(context).create_an_account,
                      style: Styles.titleTextForm),
                ),
                const SizedBox(
                  height: Dimens.mm,
                ),
                Padding(
                  padding: const EdgeInsets.all(Dimens.lp),
                  child: Form(
                    child: Column(children: [
                      FormTextField(
                        defaultFocus: true,
                        hintText: S.of(context).email,
                        icon: Icons.email,
                        onSaved: (value) => widget.email = value,
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
                      FormTextField(
                        hintText: S.of(context).password,
                        icon: Icons.lock,
                        isObscured: true,
                        onSaved: (value) => widget.password = value,
                        validator: (value) {
                          if (value?.isEmpty ??
                              false || (value?.length ?? 0) < 5) {
                            return S.of(context).invalid_password;
                          }
                        },
                      ),
                      const SizedBox(
                        height: Dimens.mm,
                      ),
                      FormTextField(
                        hintText: S.of(context).confirm_password,
                        icon: Icons.lock,
                        isObscured: true,
                        onSaved: (value) => widget.password = value,
                        validator: (value) {
                          if (value?.isEmpty ??
                              false || (value?.length ?? 0) < 5) {
                            return S.of(context).invalid_password;
                          }
                        },
                      ),
                      const SizedBox(
                        height: Dimens.mm,
                      ),
                      FormTextField(
                        hintText: S.of(context).first_name,
                        icon: Icons.person,
                        onSaved: (value) => widget.firstName = value,
                        validator: (value) {
                          if (value?.isEmpty ?? false) {
                            return S.of(context).invalid_first_name;
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: Dimens.mm,
                      ),
                      FormTextField(
                        hintText: S.of(context).last_name,
                        icon: Icons.person,
                        onSaved: (value) => widget.lastName = value,
                        validator: (value) {
                          if (value?.isEmpty ?? false) {
                            return S.of(context).invalid_last_name;
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: Dimens.mm,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: CheckboxListTile(
                          title: RichText(
                            textAlign: TextAlign.left,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                    text: S.of(context).toc_head,
                                    style: Styles.commonText),
                                TextSpan(
                                  text: S.of(context).toc_conditions_of_use,
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {},
                                  style: Styles.commonText.copyWith(
                                      decoration: TextDecoration.underline),
                                ),
                                TextSpan(
                                  text: S.of(context).toc_and,
                                  style: Styles.commonText,
                                ),
                                TextSpan(
                                  text: S.of(context).toc_privacy_notice,
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {},
                                  style: Styles.commonText.copyWith(
                                      decoration: TextDecoration.underline),
                                ),
                              ],
                            ),
                          ),
                          activeColor: Colours.tfIcon,
                          value: widget.checkedValue ?? false,
                          onChanged: (newValue) {
                            setState(() {
                              widget.checkedValue = newValue ?? false;
                            });
                          },
                          controlAffinity: ListTileControlAffinity.leading,
                        ),
                      ),
                      const SizedBox(
                        height: Dimens.mm,
                      ),
                      FormButton(text: S.of(context).register, callback: () {}),
                    ]),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
