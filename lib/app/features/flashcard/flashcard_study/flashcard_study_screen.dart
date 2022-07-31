import 'package:fe_ezlang_flashcard/app/features/flashcard/flashcard_study/components/flashcard_study_desktop.dart';
import 'package:fe_ezlang_flashcard/app/models/category.dart';
import 'package:fe_ezlang_flashcard/app/providers/flashcard_study_controller.dart';
import 'package:fe_ezlang_flashcard/app/shared_components/responsible_builder.dart';
import 'package:fe_ezlang_flashcard/app/shared_components/sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class FlashcardStudyScreen extends StatefulWidget {
  static const routeName = 'flashcardStudy';
  CategoryModel? category;

  FlashcardStudyScreen({Key? key, required this.category}) : super(key: key);

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
        desktopBuilder: (context, constraints) =>
            FlashcardStudyDesktop(category: widget.category),
      ),
    );
  }
}
