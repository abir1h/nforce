import 'package:flutter/material.dart';

import 'app_theme.dart';
class DotWidget extends StatelessWidget with AppTheme {
  final double totalWidth, dashWidth, emptyWidth, dashHeight;

  final Color dashColor;

  const DotWidget({
    this.totalWidth = 370,
    this.dashWidth = 10,
    this.emptyWidth = 2,
    this.dashHeight = 2,
    this.dashColor = Colors.black,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(
          totalWidth ~/ (dashWidth + emptyWidth),
              (index) => Container(
            width: dashWidth,
            height: dashHeight,
            color: index % 2 == 0 ? dashColor : clr.whiteColor,
            margin:
            EdgeInsets.only(left: emptyWidth / 2, right: emptyWidth / 2),
          ),
        ),
      ),
    );
  }
}
