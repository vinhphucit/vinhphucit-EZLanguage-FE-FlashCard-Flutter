import 'package:flutter/material.dart';

class ResponsiveBuilder extends StatelessWidget {
  const ResponsiveBuilder({
    this.mobileBuilder,
    this.tabletBuilder,
    required this.desktopBuilder,
    Key? key,
  }) : super(key: key);

  final Widget? Function(
    BuildContext context,
    BoxConstraints constraints,
  )? mobileBuilder;

  final Widget Function(
    BuildContext context,
    BoxConstraints constraints,
  )? tabletBuilder;

  final Widget Function(
    BuildContext context,
    BoxConstraints constraints,
  ) desktopBuilder;

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 650;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 1250 &&
      MediaQuery.of(context).size.width >= 650;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1250;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 1250) {
          return desktopBuilder(context, constraints);
        } else if (constraints.maxWidth >= 650) {
          if (tabletBuilder == null) {
            return desktopBuilder(context, constraints);
          }
          return tabletBuilder!(context, constraints);
        } else {
          if (mobileBuilder == null && tabletBuilder == null) {
            return desktopBuilder(context, constraints);
          }
          if (mobileBuilder == null) {
            return tabletBuilder!(context, constraints);
          }

          return mobileBuilder!(context, constraints)!;
        }
      },
    );
  }
}
