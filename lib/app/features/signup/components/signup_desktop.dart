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

class SignUpDesktop extends StatefulWidget {
  bool? checkedValue;
  String? email, password, firstName, lastName;
  SignUpDesktop({Key? key}) : super(key: key);

  @override
  State<SignUpDesktop> createState() => _SignUpDesktopState();
}

class _SignUpDesktopState extends State<SignUpDesktop> {
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
            Text(
              S.of(context).hey_there,
              style: TextStyle(fontSize: Dimens.lts),
            ),
            SizedBox(
              height: Dimens.sm,
            ),
            Align(
              child: Text(S.of(context).create_an_account,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: Dimens.xlts)),
            ),
            SizedBox(
              height: Dimens.mm,
            ),
            Padding(
              padding: const EdgeInsets.all(Dimens.lp),
              child: Form(
                child: Column(children: [
                  FormTextField(
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
                      if (value?.isEmpty ?? false || (value?.length ?? 0) < 5) {
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
                      if (value?.isEmpty ?? false || (value?.length ?? 0) < 5) {
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
                              text: "By creating an account, you agree to our ",
                              style: TextStyle(
                                color: const Color(0xffADA4A5),
                                fontSize: size.height * 0.015,
                              ),
                            ),
                            WidgetSpan(
                              child: InkWell(
                                onTap: () {
                                  // ignore: avoid_print
                                  print('Conditions of Use');
                                },
                                child: Text(
                                  "Conditions of Use",
                                  style: TextStyle(
                                    color: const Color(0xffADA4A5),
                                    decoration: TextDecoration.underline,
                                    fontSize: size.height * 0.015,
                                  ),
                                ),
                              ),
                            ),
                            TextSpan(
                              text: " and ",
                              style: TextStyle(
                                color: const Color(0xffADA4A5),
                                fontSize: size.height * 0.015,
                              ),
                            ),
                            WidgetSpan(
                              child: InkWell(
                                onTap: () {
                                  // ignore: avoid_print
                                  print('Privacy Notice');
                                },
                                child: Text(
                                  "Privacy Notice",
                                  style: TextStyle(
                                    color: const Color(0xffADA4A5),
                                    decoration: TextDecoration.underline,
                                    fontSize: size.height * 0.015,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      activeColor: const Color(0xff7B6F72),
                      value: widget.checkedValue ?? false,
                      onChanged: (newValue) {
                        setState(() {
                          widget.checkedValue = newValue ?? false;
                        });
                      },
                      controlAffinity: ListTileControlAffinity.leading,
                    ),
                  ),
                  SizedBox(
                    height: Dimens.mm,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(S.of(context).register,
                          style: TextStyle(
                              color: Colours.tf_text,
                              fontSize: 18,
                              fontWeight: FontWeight.normal)),
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(Dimens.m_radius),
                      ),
                      primary: Colors.black,
                      minimumSize: Size(size.width, 50),
                    ),
                  ),
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
