import 'package:fe_ezlang_flashcard/app/features/flashcard/flashcards/components/flashcards_desktop.dart';
import 'package:fe_ezlang_flashcard/app/models/category.dart';
import 'package:fe_ezlang_flashcard/app/providers/flashcards_controller.dart';
import 'package:fe_ezlang_flashcard/app/shared_components/responsible_builder.dart';
import 'package:fe_ezlang_flashcard/app/shared_components/sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class FlashcardsScreen extends StatefulWidget {
  static const routeName = 'flashcards';
  CategoryModel? category;
  FlashcardsScreen({Key? key, this.category}) : super(key: key);

  @override
  State<FlashcardsScreen> createState() => _FlashcardsScreenState();
}

class _FlashcardsScreenState extends State<FlashcardsScreen> {
  @override
  void initState() {
    super.initState();

    if (widget.category != null && widget.category!.id != null) {
      Provider.of<FlashcardsController>(context, listen: false)
          .getFlashcards(widget.category!.id!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key:
          Provider.of<FlashcardsController>(context, listen: false).scaffoldKey,
      drawer: SideMenu(),
      body: ResponsiveBuilder(
        desktopBuilder: (context, constraints) =>
            FlashcardsDesktop(category: widget.category),
      ),
    );
  }
}
