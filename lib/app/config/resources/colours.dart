import 'package:flutter/material.dart';

class Colours {
  static const tfIcon = Color(0xff7B6F72);
  static const tfText = Color(0xffADA4A5);
  static const specialLink = Color(0xffC58BF2);

  static const kFontColorPallets = [
    Color.fromRGBO(255, 255, 255, 1),
    Color.fromRGBO(210, 210, 210, 1),
    Color.fromRGBO(170, 170, 170, 1),
  ];

  static Color toColor(String str) {
    var hash = 0;
    for (var i = 0; i < str.length; i++) {
      hash = str.codeUnitAt(i) + ((hash << 5) - hash);
    }
    var colour = 'ff';
    for (var i = 0; i < 3; i++) {
      var value = (hash >> (i * 8)) & 0xFF;
      colour += (value.toRadixString(16));
    }
    return HexColor.fromHex(colour);
  }
}

extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}
