import 'package:fe_ezlang_flashcard/app/config/resources/dimens.dart';
import 'package:fe_ezlang_flashcard/app/providers/create_category_controller.dart';
import 'package:fe_ezlang_flashcard/app/shared_components/form_button.dart';
import 'package:fe_ezlang_flashcard/app/shared_components/form_text_field.dart';
import 'package:fe_ezlang_flashcard/app/shared_components/header.dart';
import 'package:fe_ezlang_flashcard/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class CreateCategoryDesktop extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey();
  Function(String title, String description) callback;
  String _title = '', _description = '';
  CreateCategoryDesktop({Key? key, required this.callback}) : super(key: key);
  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    _formKey.currentState!.save();

    await callback(_title, _description);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(Dimens.mp),
        child: Column(
          children: [
            Header(
                onPressedMenu: () => Provider.of<CreateCategoryController>(
                        context,
                        listen: false)
                    .openDrawer()),
            const SizedBox(
              height: Dimens.mm,
            ),
            Padding(
              padding: const EdgeInsets.all(Dimens.lp),
              child: Form(
                key: _formKey,
                child: Column(children: [
                  Consumer<CreateCategoryController>(
                    builder: (context, value, child) => FormTextField(
                      defaultFocus: true,
                      hintText: S.of(context).title,
                      icon: Icons.title,
                      disabled: value.isLoading,
                      onSaved: (value) => _title = value ?? '',
                      validator: (value) {
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: Dimens.mm,
                  ),
                  Consumer<CreateCategoryController>(
                    builder: (context, value, child) => FormTextField(
                      hintText: S.of(context).description,
                      icon: Icons.description,
                      disabled: value.isLoading,
                      defaultFocus: true,
                      onSaved: (value) => _description = value ?? '',
                      validator: (value) {
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: Dimens.xlm,
                  ),
                  Consumer<CreateCategoryController>(
                    builder: (context, value, child) => FormButton(
                      isLoading: value.isLoading,
                      text: S.of(context).continues.toUpperCase(),
                      callback: _submit,
                    ),
                  )
                ]),
              ),
            )
          ],
        ),
      )),
    );
  }
}
