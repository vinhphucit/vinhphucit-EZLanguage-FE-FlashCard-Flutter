import 'package:fe_ezlang_flashcard/app/features/flashcard/components/flash_card_desktop.dart';
import 'package:fe_ezlang_flashcard/app/providers/flash_card_controller.dart';
import 'package:fe_ezlang_flashcard/app/shared_components/responsible_builder.dart';
import 'package:fe_ezlang_flashcard/app/shared_components/sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class FlashCardScreen extends StatefulWidget {
  static String routeName = 'flashcard';

  const FlashCardScreen({Key? key}) : super(key: key);

  @override
  State<FlashCardScreen> createState() => _FlashCardScreenState();
}

class _FlashCardScreenState extends State<FlashCardScreen> {
  @override
  initState() {
    super.initState();
    Provider.of<FlashCardController>(context, listen: false).getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Provider.of<FlashCardController>(context, listen: false).scaffoldKey,
      drawer: SideMenu(),
      body: ResponsiveBuilder(
        desktopBuilder: (context, constraints) => FlashCardDesktop(),
      ),
    );
  }
}
