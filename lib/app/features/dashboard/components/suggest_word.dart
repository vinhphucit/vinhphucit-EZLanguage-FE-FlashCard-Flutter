import 'package:fe_ezlang_flashcard/app/config/resources/colours.dart';
import 'package:fe_ezlang_flashcard/app/config/resources/dimens.dart';
import 'package:fe_ezlang_flashcard/app/config/resources/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class SuggestWord extends StatefulWidget {
  const SuggestWord({Key? key}) : super(key: key);

  @override
  State<SuggestWord> createState() => _SuggestWordState();
}

class _SuggestWordState extends State<SuggestWord> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimens.lRadius),
          image: DecorationImage(
              image: Image.network(
                "https://picsum.photos/id/237/200/300",
                errorBuilder: (context, error, stackTrace) {
                  return Text("HELLO");
                },
              ).image,
              fit: BoxFit.cover)),
      width: double.infinity,
      child: Card(
        color: Colors.black.withOpacity(0.4),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimens.lRadius),
        ),
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(Dimens.lp),
            child: Column(children: [
              Text(
                "checkmate",
                style: Styles.titleTextForm.copyWith(fontSize: Dimens.xxlts),
              ),
              Text(
                "a winning position in chess in which you have put the other player's king under a direct attack from which it cannot escape",
                style: Styles.subtitleText,
              ),
              SizedBox(
                height: Dimens.xlm,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  primary: Colours.specialLink,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  "Study Now",
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
