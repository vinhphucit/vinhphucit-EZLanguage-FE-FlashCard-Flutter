import 'package:fe_ezlang_flashcard/app/features/flashcard/create_category/components/create_category_desktop.dart';
import 'package:fe_ezlang_flashcard/app/providers/create_category_controller.dart';
import 'package:fe_ezlang_flashcard/app/shared_components/responsible_builder.dart';
import 'package:fe_ezlang_flashcard/app/shared_components/sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class CreateCategoryScreen extends StatelessWidget {
  static const routeName = 'createCategory';
  const CreateCategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Provider.of<CreateCategoryController>(context, listen: false)
          .scaffoldKey,
      drawer: SideMenu(),
      body: ResponsiveBuilder(
        desktopBuilder: (context, constraints) => CreateCategoryDesktop(),
      ),
    );
  }
}
