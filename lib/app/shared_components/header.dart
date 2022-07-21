import 'package:fe_ezlang_flashcard/app/config/resources/dimens.dart';
import 'package:fe_ezlang_flashcard/app/shared_components/search_field.dart';
import 'package:fe_ezlang_flashcard/app/shared_components/time_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Header extends StatelessWidget {
  Function() onPressedMenu;
  Header({Key? key, required this.onPressedMenu}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(onPressed: onPressedMenu, icon: const Icon(Icons.menu)),
        const SizedBox(width: Dimens.sm),
        const TimeText(),
        const SizedBox(width: Dimens.lm),
        Expanded(child: SearchField()),
      ],
    );
  }
}
