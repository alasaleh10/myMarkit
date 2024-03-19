import 'package:flutter/material.dart';

class AdaptiveLayOut extends StatelessWidget {
  final WidgetBuilder mobileLayout, tabletLAyout, desktopLayout;
  const AdaptiveLayOut({
    super.key,
    required this.mobileLayout,
    required this.tabletLAyout,
    required this.desktopLayout,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth <= 550) {
          return mobileLayout(context);
        } else if (constraints.maxWidth <= 950) {
          return tabletLAyout(context);
        } else {
          return desktopLayout(context);
        }
      },
    );
  }
}
