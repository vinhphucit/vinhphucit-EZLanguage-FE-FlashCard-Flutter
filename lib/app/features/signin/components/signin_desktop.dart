import 'package:fe_ezlang_flashcard/app/config/resources/colours.dart';
import 'package:fe_ezlang_flashcard/app/config/resources/dimens.dart';
import 'package:fe_ezlang_flashcard/app/features/forgot_password/forgot_password_screen.dart';
import 'package:fe_ezlang_flashcard/app/features/signup/signup_screen.dart';
import 'package:fe_ezlang_flashcard/app/shared_components/form_button.dart';
import 'package:fe_ezlang_flashcard/app/shared_components/form_text_field.dart';
import 'package:fe_ezlang_flashcard/app/utils/extensions/get_string_ex.dart';
import 'package:fe_ezlang_flashcard/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class SignInDesktop extends StatelessWidget {
  SignInDesktop({Key? key}) : super(key: key);
  String? email, password;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: [
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
              child: Text(S.of(context).welcome_back,
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
                  FormTextField(
                    hintText: S.of(context).password,
                    icon: Icons.lock,
                    isObscured: true,
                    onSaved: (value) => password = password,
                    validator: (value) {
                      if (value?.isEmpty ?? false || (value?.length ?? 0) < 5) {
                        return S.of(context).invalid_password;
                      }
                    },
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed(ForgotPasswordScreen.routeName);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(Dimens.mp),
                        child: Text(
                          S.of(context).forgot_password,
                          style: TextStyle(
                            color: Colours.tf_text,
                            decoration: TextDecoration.underline,
                            fontSize: Dimens.mts,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Dimens.mm,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(S.of(context).signin,
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
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Don’t have an account yet? '),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed(SignUpScreen.routeName);
                          },
                          child: Text(
                            'Register',
                            style: TextStyle(
                              color: Color(0xffC58BF2),
                              // color: const Color(0xffC58BF2),
                              fontSize: Dimens.lts,
                            ),
                          ))
                    ],
                  )
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
