import 'package:flutter/material.dart';

extension GlobalKeyEx on GlobalKey {
  double get height {
    final keyContext2 = this.currentContext;
    if (keyContext2 != null) {
      final box = keyContext2.findRenderObject() as RenderBox;

      return box.size.height;
    }
    return 0;
  }
}
