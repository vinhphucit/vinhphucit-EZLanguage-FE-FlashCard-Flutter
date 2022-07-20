import 'package:fe_ezlang_flashcard/app/config/resources/colours.dart';
import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  SearchField({this.onSearch, Key? key}) : super(key: key);

  final controller = TextEditingController();
  final Function(String value)? onSearch;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        prefixIcon: const Icon(Icons.search),
        hintText: "search..",
        isDense: true,
        fillColor: Theme.of(context).cardColor,
      ),
      onEditingComplete: () {
        FocusScope.of(context).unfocus();
        if (onSearch != null) onSearch!(controller.text);
      },
      textInputAction: TextInputAction.search,
      style: TextStyle(color: Colours.kFontColorPallets[1]),
    );
  }
}
