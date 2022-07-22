import 'package:fe_ezlang_flashcard/app/config/resources/dimens.dart';
import 'package:fe_ezlang_flashcard/app/providers/create_category_controller.dart';
import 'package:fe_ezlang_flashcard/app/shared_components/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class CreateCategoryDesktop extends StatelessWidget {
  const CreateCategoryDesktop({Key? key}) : super(key: key);

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
          ],
        ),
      )),
    );
  }
}
