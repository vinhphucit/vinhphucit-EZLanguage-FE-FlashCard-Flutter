import 'package:fe_ezlang_flashcard/app/config/resources/colours.dart';
import 'package:fe_ezlang_flashcard/app/config/resources/dimens.dart';
import 'package:fe_ezlang_flashcard/app/features/reset_password/reset_password_screen.dart';
import 'package:fe_ezlang_flashcard/app/providers/forgot_password_controller.dart';
import 'package:fe_ezlang_flashcard/app/shared_components/form_button.dart';
import 'package:fe_ezlang_flashcard/app/shared_components/form_text_field.dart';
import 'package:fe_ezlang_flashcard/app/utils/extensions/get_string_ex.dart';
import 'package:fe_ezlang_flashcard/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ForgotPasswordDesktop extends StatelessWidget {
  Function(String email) callback;
  final GlobalKey<FormState> _formKey = GlobalKey();
  ForgotPasswordDesktop({Key? key, required this.callback}) : super(key: key);
  String? email;

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    _formKey.currentState!.save();

    await callback(email!);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Stack(children: [
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: Dimens.mp, vertical: Dimens.mp),
            child: Row(
              children: [
                InkWell(
                  key: Key('forgot_password_back'),
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
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          S.of(context).forgot_password_consolation,
                        ),
                      ),
                      const SizedBox(
                        height: Dimens.mm,
                      ),
                      Form(
                        key: _formKey,
                        child: Column(children: [
                          Consumer<ForgotPasswordController>(
                            builder: (context, value, child) => FormTextField(
                              hintText: S.of(context).email,
                              icon: Icons.email,
                              disabled: value.isLoading,
                              defaultFocus: true,
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
                          Consumer<ForgotPasswordController>(
                            builder: (context, value, child) => FormButton(
                                isLoading: value.isLoading,
                                text: S.of(context).send_instruction,
                                callback: _submit),
                          )
                        ]),
                      ),
                    ],
                  )),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(S.of(context).already_have_code),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed(ResetPasswordScreen.routeName);
                      },
                      child: Text(
                        S.of(context).activate,
                        style: const TextStyle(
                          color: Colours.specialLink,
                          fontSize: Dimens.lts,
                        ),
                      ))
                ],
              )
            ],
          ),
        ]),
      ),
    );
  }
}
