import 'package:fe_ezlang_flashcard/app/config/resources/dimens.dart';
import 'package:fe_ezlang_flashcard/app/config/resources/styles.dart';
import 'package:fe_ezlang_flashcard/app/features/flashcard/create_category/create_category_screen.dart';
import 'package:fe_ezlang_flashcard/app/models/category.dart';
import 'package:fe_ezlang_flashcard/app/providers/flashcard_home_controller.dart';
import 'package:fe_ezlang_flashcard/app/shared_components/header.dart';
import 'package:fe_ezlang_flashcard/app/shared_components/horizontal_container.dart';
import 'package:fe_ezlang_flashcard/app/shared_components/rounded_background_image_container.dart';
import 'package:fe_ezlang_flashcard/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class FlashCardHomeDesktop extends StatelessWidget {
  const FlashCardHomeDesktop({Key? key}) : super(key: key);

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
                    Provider.of<FlashCardHomeController>(context, listen: false)
                        .openDrawer()),
            const SizedBox(
              height: Dimens.mm,
            ),
            HorizontalContainer(
              title: "Classes",
              child: _HorizontalList(),
            )
          ],
        ),
      )),
    );
  }
}

class _HorizontalList extends StatelessWidget {
  _HorizontalList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        height: 200,
        child: Consumer<FlashCardHomeController>(
          builder: (context, value, child) {
            return ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                _AddItem(),
                ...(value.categories
                    .map((e) => _ListItem(category: e))
                    .toList()),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _AddItem extends StatelessWidget {
  const _AddItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RoundedBackgroundImageContainer(
      onTap: () => Navigator.pushNamed(context, CreateCategoryScreen.routeName),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.add),
          Text(
            S.of(context).add_more,
            style: Styles.titleText,
          )
        ],
      ),
    );
  }
}

class _ListItem extends StatelessWidget {
  CategoryModel category;
  _ListItem({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RoundedBackgroundImageContainer(
      color: Colors.blueGrey[900],
      child: Container(
        constraints: BoxConstraints(maxWidth: 200),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: Dimens.mp),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                overflow: TextOverflow.ellipsis,
                category.title ?? '',
                style: Styles.titleText,
              ),
              Text(
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                category.description ?? '',
                style: Styles.subtitleText,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
