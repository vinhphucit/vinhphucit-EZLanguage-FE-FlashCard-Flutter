import 'package:fe_ezlang_flashcard/app/config/resources/dimens.dart';
import 'package:fe_ezlang_flashcard/app/features/flashcard/flashcard_study/flashcard_study_screen.dart';
import 'package:fe_ezlang_flashcard/app/models/category.dart';
import 'package:fe_ezlang_flashcard/app/providers/flashcards_controller.dart';
import 'package:fe_ezlang_flashcard/app/shared_components/form_button.dart';
import 'package:fe_ezlang_flashcard/app/shared_components/form_text_field.dart';
import 'package:fe_ezlang_flashcard/app/shared_components/header.dart';
import 'package:fe_ezlang_flashcard/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class FlashcardsDesktop extends StatelessWidget {
  CategoryModel? category;
  FlashcardsDesktop({Key? key, this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(Dimens.mp),
        child: Column(
          children: [
            Header(
                onPressedMenu: () =>
                    Provider.of<FlashcardsController>(context, listen: false)
                        .openDrawer()),
            const SizedBox(
              height: Dimens.mm,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                                title: Text("New Flashcard"),
                                content: _NewFlashCard(category: category),
                              ));
                    },
                    child: Text("New")),
                TextButton(
                    onPressed: () {
                      Navigator.pushNamed(
                          context, FlashcardStudyScreen.routeName,
                          arguments: category);
                    },
                    child: Text("Learn")),
              ],
            ),
            Container(
              child: Consumer<FlashcardsController>(
                builder: (context, value, child) {
                  if (value.isLoading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    if (value.flashcards.isEmpty) {
                      return Text("No Items");
                    } else {
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: value.flashcards.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(value.flashcards[index].title!),
                            subtitle:
                                Text(value.flashcards[index].description!),
                          );
                        },
                      );
                    }
                  }
                },
              ),
            ),
          ],
        ),
      )),
    );
  }
}

class _NewFlashCard extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey();
  CategoryModel? category;
  String? _description;

  String? _title;
  _NewFlashCard({Key? key, this.category}) : super(key: key);
  Future<void> _submit(BuildContext context) async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    _formKey.currentState!.save();
    var newFlashcard =
        await Provider.of<FlashcardsController>(context, listen: false)
            .createFlashcard(category!.id!,
                title: _title, description: _description);

    await Provider.of<FlashcardsController>(context, listen: false)
        .addFlashcard(newFlashcard);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.6,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Form(
            key: _formKey,
            child: Column(children: [
              Consumer<FlashcardsController>(
                builder: (context, value, child) => FormTextField(
                  hintText: S.of(context).title,
                  icon: Icons.email,
                  disabled: value.isLoading,
                  onSaved: (value) => _title = value,
                  validator: (value) {
                    if ((value?.isEmpty ?? false) || (value?.length ?? 0) < 1) {
                      return S.of(context).invalid_title;
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(
                height: Dimens.mm,
              ),
              Consumer<FlashcardsController>(
                builder: (context, value, child) => FormTextField(
                  hintText: S.of(context).description,
                  icon: Icons.key,
                  disabled: value.isLoading,
                  onSaved: (value) => _description = value,
                  validator: (value) {
                    if ((value?.isEmpty ?? false) || (value?.length ?? 0) < 1) {
                      return S.of(context).invalid_description;
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(
                height: Dimens.xlm,
              ),
              Consumer<FlashcardsController>(
                builder: (context, value, child) => FormButton(
                    isLoading: value.isLoading,
                    text: S.of(context).ok,
                    callback: () {
                      _submit(context);
                    }),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
