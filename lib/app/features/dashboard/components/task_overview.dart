import 'package:fe_ezlang_flashcard/app/shared_components/task_card.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class TaskOverview extends StatelessWidget {
  const TaskOverview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TaskCard();
  }
}
