import 'package:fe_ezlang_flashcard/app/config/resources/colours.dart';
import 'package:fe_ezlang_flashcard/app/config/resources/dimens.dart';
import 'package:fe_ezlang_flashcard/app/config/resources/styles.dart';
import 'package:fe_ezlang_flashcard/app/features/auth/activate_account/activate_account_screen.dart';
import 'package:fe_ezlang_flashcard/app/providers/signup_controller.dart';
import 'package:fe_ezlang_flashcard/app/shared_components/form_button.dart';
import 'package:fe_ezlang_flashcard/app/shared_components/form_text_field.dart';
import 'package:fe_ezlang_flashcard/app/utils/snackbar_utils.dart';
import 'package:fe_ezlang_flashcard/generated/l10n.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fe_ezlang_flashcard/app/utils/extensions/get_string_ex.dart';
import 'package:provider/provider.dart';

class SignUpDesktop extends StatefulWidget {
  Function(String email, String password, String firstName, String lastName)
      submitForm;
  SignUpDesktop({Key? key, required this.submitForm}) : super(key: key);

  @override
  State<SignUpDesktop> createState() => _SignUpDesktopState();
}

class _SignUpDesktopState extends State<SignUpDesktop> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  bool? checkedValue;
  String? email, password, firstName, lastName;
  final TextEditingController _passwordController = TextEditingController();
  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    if (!(checkedValue ?? false)) {
      SnackbarUtils.buildSnackbar(context, S.of(context).tof_accept_required);
      return;
    }
    _formKey.currentState!.save();

    await widget.submitForm(email!, password!, firstName!, lastName!);
  }

  @override
  Widget build(BuildContext context) {
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
                    key: Key('signup_back'),
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
                    key: _formKey,
                    child: Column(children: [
                      Consumer<SignUpController>(
                        builder: (context, value, child) => FormTextField(
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
                      Consumer<SignUpController>(
                        builder: (context, value, child) => FormTextField(
                          hintText: S.of(context).password,
                          controller: _passwordController,
                          icon: Icons.lock,
                          isObscured: true,
                          disabled: value.isLoading,
                          onSaved: (value) => password = value,
                          validator: (value) {
                            if (value?.isEmpty ??
                                false || (value?.length ?? 0) < 5) {
                              return S.of(context).invalid_password;
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: Dimens.mm,
                      ),
                      Consumer<SignUpController>(
                        builder: (context, value, child) => FormTextField(
                          hintText: S.of(context).confirm_password,
                          icon: Icons.sync,
                          isObscured: true,
                          disabled: value.isLoading,
                          onSaved: (value) => password = value,
                          validator: (value) {
                            if ((value?.isEmpty ?? false) ||
                                (value != _passwordController.text)) {
                              return S.of(context).invalid_password_reenter;
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: Dimens.mm,
                      ),
                      Consumer<SignUpController>(
                        builder: (context, value, child) => FormTextField(
                          hintText: S.of(context).first_name,
                          icon: Icons.person,
                          disabled: value.isLoading,
                          onSaved: (value) => firstName = value,
                          validator: (value) {
                            if (value?.isEmpty ?? false) {
                              return S.of(context).invalid_first_name;
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: Dimens.mm,
                      ),
                      Consumer<SignUpController>(
                        builder: (context, value, child) => FormTextField(
                          hintText: S.of(context).last_name,
                          icon: Icons.person,
                          disabled: value.isLoading,
                          onSaved: (value) => lastName = value,
                          validator: (value) {
                            if (value?.isEmpty ?? false) {
                              return S.of(context).invalid_last_name;
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: Dimens.mm,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Consumer<SignUpController>(
                          builder: (context, value, child) => CheckboxListTile(
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
                            value: checkedValue ?? false,
                            onChanged: value.isLoading
                                ? null
                                : (newValue) {
                                    setState(() {
                                      checkedValue = newValue ?? false;
                                    });
                                  },
                            controlAffinity: ListTileControlAffinity.leading,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: Dimens.mm,
                      ),
                      Consumer<SignUpController>(
                        builder: (context, value, child) => FormButton(
                            text: S.of(context).register,
                            isLoading: value.isLoading,
                            callback: _submit),
                      ),
                    ]),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(S.of(context).already_have_activation_code),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(ActivateAccountScreen.routeName);
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
          ],
        ),
      ),
    );
  }
}
