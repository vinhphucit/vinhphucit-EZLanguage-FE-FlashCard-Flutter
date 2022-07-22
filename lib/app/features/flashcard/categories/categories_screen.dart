import 'package:fe_ezlang_flashcard/app/features/flashcard/categories/components/categories_desktop.dart';
import 'package:fe_ezlang_flashcard/app/providers/categories_controller.dart';
import 'package:fe_ezlang_flashcard/app/shared_components/responsible_builder.dart';
import 'package:fe_ezlang_flashcard/app/shared_components/sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class CategoriesScreen extends StatelessWidget {
  static const routeName = 'categories';
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key:
          Provider.of<CategoriesController>(context, listen: false).scaffoldKey,
      drawer: SideMenu(),
      body: ResponsiveBuilder(
        desktopBuilder: (context, constraints) => CategoriesDesktop(),
      ),
    );
  }
}
