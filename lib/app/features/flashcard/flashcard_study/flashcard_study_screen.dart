import 'package:fe_ezlang_flashcard/app/features/flashcard/flashcard_study/components/flashcard_study_desktop.dart';
import 'package:fe_ezlang_flashcard/app/models/category.dart';
import 'package:fe_ezlang_flashcard/app/models/flashcard.dart';
import 'package:fe_ezlang_flashcard/app/providers/flashcard_study_controller.dart';
import 'package:fe_ezlang_flashcard/app/shared_components/responsible_builder.dart';
import 'package:fe_ezlang_flashcard/app/shared_components/sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class FlashcardStudyScreenArguments {
  final CategoryModel category;
  final List<FlashcardModel> flashcards;

  FlashcardStudyScreenArguments(
      {required this.category, required this.flashcards});
}

class FlashcardStudyScreen extends StatefulWidget {
  static const routeName = 'flashcardStudy';
  CategoryModel? category;
  List<FlashcardModel>? flashcards;

  FlashcardStudyScreen(
      {Key? key, required FlashcardStudyScreenArguments arguments})
      : super(key: key) {
    category = arguments.category;
    flashcards = arguments.flashcards;
  }

  @override
  State<FlashcardStudyScreen> createState() => _FlashcardStudyScreenState();
}

class _FlashcardStudyScreenState extends State<FlashcardStudyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Provider.of<FlashcardStudyController>(context, listen: false)
          .scaffoldKey,
      body: ResponsiveBuilder(
        desktopBuilder: (context, constraints) => FlashcardStudyDesktop(
          category: widget.category,
          flashcards: widget.flashcards,
        ),
      ),
    );
  }
}
