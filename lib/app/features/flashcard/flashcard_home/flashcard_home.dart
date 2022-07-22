import 'package:fe_ezlang_flashcard/app/features/flashcard/flashcard_home/components/flashcard_home_desktop.dart';
import 'package:fe_ezlang_flashcard/app/providers/flashcard_home_controller.dart';
import 'package:fe_ezlang_flashcard/app/shared_components/responsible_builder.dart';
import 'package:fe_ezlang_flashcard/app/shared_components/sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class FlashCardHomeScreen extends StatefulWidget {
  static String routeName = 'flashcard';

  const FlashCardHomeScreen({Key? key}) : super(key: key);

  @override
  State<FlashCardHomeScreen> createState() => _FlashCardHomeScreenState();
}

class _FlashCardHomeScreenState extends State<FlashCardHomeScreen> {
  bool isInit = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!isInit) {
      Provider.of<FlashCardHomeController>(context, listen: false)
          .getCategories();
      isInit = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Provider.of<FlashCardHomeController>(context, listen: false)
          .scaffoldKey,
      drawer: SideMenu(),
      body: ResponsiveBuilder(
        desktopBuilder: (context, constraints) => FlashCardHomeDesktop(),
      ),
    );
  }
}
