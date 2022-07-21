import 'package:fe_ezlang_flashcard/app/config/resources/dimens.dart';
import 'package:fe_ezlang_flashcard/app/providers/flash_card_controller.dart';
import 'package:fe_ezlang_flashcard/app/shared_components/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class FlashCardDesktop extends StatelessWidget {
  const FlashCardDesktop({Key? key}) : super(key: key);

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
                    Provider.of<FlashCardController>(context, listen: false)
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
