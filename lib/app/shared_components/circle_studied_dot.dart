import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CircleStudiedDot extends StatefulWidget {
  Color color;
  bool? selected = false;
  CircleStudiedDot({Key? key, required this.color, this.selected})
      : super(key: key);

  @override
  State<CircleStudiedDot> createState() => _CircleStudiedDotState();
}

class _CircleStudiedDotState extends State<CircleStudiedDot>
    with TickerProviderStateMixin {
  late AnimationController _resizableController;
  @override
  void initState() {
    _resizableController = new AnimationController(
      vsync: this,
      duration: new Duration(
        milliseconds: 1000,
      ),
    );
    _resizableController.addStatusListener((animationStatus) {
      switch (animationStatus) {
        case AnimationStatus.completed:
          _resizableController.reverse();
          break;
        case AnimationStatus.dismissed:
          _resizableController.forward();
          break;
        case AnimationStatus.forward:
          break;
        case AnimationStatus.reverse:
          break;
      }
    });
    _resizableController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _resizableController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.selected ?? false) {
      return AnimatedBuilder(
        animation: _resizableController,
        builder: (context, child) {
          return Container(
            decoration: BoxDecoration(
              color: widget.color,
              shape: BoxShape.circle,
              border: Border.all(
                  color: Colors.white, width: _resizableController.value * 2),
            ),
            height: 10,
            width: 10,
          );
        },
      );
    } else {
      return Container(
        decoration: BoxDecoration(
          color: widget.color,
          shape: BoxShape.circle,
        ),
        height: 10,
        width: 10,
      );
    }
  }
}
