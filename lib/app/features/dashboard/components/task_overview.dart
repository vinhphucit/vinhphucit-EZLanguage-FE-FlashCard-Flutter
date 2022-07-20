import 'package:fe_ezlang_flashcard/app/config/resources/dimens.dart';
import 'package:fe_ezlang_flashcard/app/shared_components/task_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class TaskOverview extends StatelessWidget {
  const TaskOverview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StaggeredGrid.count(
      crossAxisCount: 2,
      crossAxisSpacing: Dimens.sp,
      children: [
        TaskCard(title: "Robinson"),
        TaskCard(title: "Robinson Crouso2"),
        TaskCard(title: "Robinson Cr"),
        TaskCard(title: "Robi3 Crouso3")
      ],
    );

    // ListView(
    //   children: [

    //   ],
    // );
  }
}
