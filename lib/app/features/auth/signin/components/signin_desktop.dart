import 'package:fe_ezlang_flashcard/app/config/resources/colours.dart';
import 'package:fe_ezlang_flashcard/app/config/resources/dimens.dart';
import 'package:fe_ezlang_flashcard/app/config/resources/styles.dart';
import 'package:fe_ezlang_flashcard/app/features/auth/forgot_password/forgot_password_screen.dart';
import 'package:fe_ezlang_flashcard/app/features/auth/signup/signup_screen.dart';
import 'package:fe_ezlang_flashcard/app/providers/app_controller.dart';
import 'package:fe_ezlang_flashcard/app/providers/signin_controller.dart';
import 'package:fe_ezlang_flashcard/app/shared_components/form_button.dart';
import 'package:fe_ezlang_flashcard/app/shared_components/form_text_field.dart';
import 'package:fe_ezlang_flashcard/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:fe_ezlang_flashcard/app/utils/extensions/get_string_ex.dart';
import 'package:provider/provider.dart';

class SignInDesktop extends StatefulWidget {
  Function(String email, String password) callback;
  SignInDesktop({Key? key, required this.callback}) : super(key: key);

  @override
  State<SignInDesktop> createState() => _SignInDesktopState();
}

class _SignInDesktopState extends State<SignInDesktop> {
  String? email, password;

  final GlobalKey<FormState> _formKey = GlobalKey();

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    _formKey.currentState!.save();

    await widget.callback(email!, password!);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
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
              child: Text(S.of(context).welcome_back,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: Dimens.xlts)),
            ),
            const SizedBox(
              height: Dimens.mm,
            ),
            Padding(
              padding: const EdgeInsets.all(Dimens.lp),
              child: Form(
                key: _formKey,
                child: Column(children: [
                  Consumer<SignInController>(
                    builder: (context, value, child) => FormTextField(
                      key: const Key('k_signin_email'),
                      defaultFocus: true,
                      hintText: S.of(context).email,
                      icon: Icons.email,
                      disabled: value.isLoading,
                      onSaved: (value) => email = value,
                      validator: (value) {
                        if (!(value as String).isValidEmail) {
                          return S.of(context).invalid_email;
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: Dimens.mm,
                  ),
                  Consumer<SignInController>(
                    builder: (context, value, child) => FormTextField(
                      key: const Key('k_signin_password'),
                      hintText: S.of(context).password,
                      icon: Icons.lock,
                      isObscured: true,
                      disabled: value.isLoading,
                      defaultFocus: true,
                      onSaved: (value) => password = value,
                      validator: (value) {
                        if ((value?.isEmpty ?? false) ||
                            (value?.length ?? 0) < 5) {
                          return S.of(context).invalid_password;
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: Dimens.sm,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: TextButton(
                        key: const Key('k_signin_forgotpassword_btn'),
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(ForgotPasswordScreen.routeName);
                        },
                        child: Text(
                          S.of(context).forgot_password,
                          style: Styles.commonText
                              .copyWith(decoration: TextDecoration.underline),
                        )),
                  ),
                  const SizedBox(
                    height: Dimens.sm,
                  ),
                  Consumer<SignInController>(
                    builder: (context, value, child) => FormButton(
                      key: const Key('k_signin_submit_btn'),
                      isLoading: value.isLoading,
                      text: S.of(context).signin,
                      callback: _submit,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(S.of(context).do_not_have_account),
                      TextButton(
                          key: const Key('k_signin_signup_btn'),
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed(SignUpScreen.routeName);
                          },
                          child: Text(
                            S.of(context).register,
                            style: const TextStyle(
                              color: Colours.specialLink,
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
