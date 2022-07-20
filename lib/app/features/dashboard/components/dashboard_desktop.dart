import 'package:fe_ezlang_flashcard/app/config/resources/dimens.dart';
import 'package:fe_ezlang_flashcard/app/features/dashboard/components/suggest_word.dart';
import 'package:fe_ezlang_flashcard/app/features/dashboard/components/task_overview.dart';
import 'package:fe_ezlang_flashcard/app/shared_components/search_field.dart';
import 'package:fe_ezlang_flashcard/app/shared_components/time_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class DashboardDesktop extends StatelessWidget {
  const DashboardDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(Dimens.mp),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const TimeText(),
                const SizedBox(width: Dimens.lm),
                Expanded(child: SearchField()),
              ],
            ),
            const SizedBox(
              height: Dimens.mm,
            ),
            SuggestWord(),
            const SizedBox(
              height: Dimens.mm,
            ),
            TaskOverview()
          ],
        ),
      )),
    );
  }
}
