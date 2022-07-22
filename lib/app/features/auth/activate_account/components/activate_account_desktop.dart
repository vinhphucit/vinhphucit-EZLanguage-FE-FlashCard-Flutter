import 'package:fe_ezlang_flashcard/app/config/resources/dimens.dart';
import 'package:fe_ezlang_flashcard/app/providers/activate_account_controller.dart';
import 'package:fe_ezlang_flashcard/app/shared_components/form_button.dart';
import 'package:fe_ezlang_flashcard/app/shared_components/form_text_field.dart';
import 'package:fe_ezlang_flashcard/app/utils/extensions/get_string_ex.dart';
import 'package:fe_ezlang_flashcard/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ActivateAccountDesktop extends StatelessWidget {
  ActivateAccountDesktop({Key? key, required this.callback}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey();
  Function(String email, String code) callback;
  String? email, code;

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    _formKey.currentState!.save();

    await callback(email!, code!);
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
                        child: Text(S.of(context).activate_account,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: Dimens.xlts)),
                      ),
                      const SizedBox(
                        height: Dimens.mm,
                      ),
                      Form(
                        key: _formKey,
                        child: Column(children: [
                          Consumer<ActivateAccountController>(
                            builder: (context, value, child) => FormTextField(
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
                          Consumer<ActivateAccountController>(
                            builder: (context, value, child) => FormTextField(
                              hintText: S.of(context).code,
                              icon: Icons.key,
                              disabled: value.isLoading,
                              onSaved: (value) => code = value,
                              validator: (value) {
                                if ((value?.isEmpty ?? false) ||
                                    (value?.length ?? 0) < 5) {
                                  return S.of(context).invalid_email;
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(
                            height: Dimens.xlm,
                          ),
                          Consumer<ActivateAccountController>(
                            builder: (context, value, child) => FormButton(
                                isLoading: value.isLoading,
                                text: S.of(context).activate,
                                callback: _submit),
                          ),
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
