import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nuforce/main.dart';

extension TitleCase on String? {
  String toTitleCase() {
    if (this == null) return '';
    return this![0].toUpperCase() + this!.substring(1);
  }
}

extension AddSpacing on num {
  /// Convert number to Vertical Spacing
  Widget get vSpace => SizedBox(height: toDouble());

  /// Convert number to Horizontal Spacing
  Widget get hSpace => SizedBox(width: toDouble());
}

extension IpadSize on Widget {
  Widget get ifIpad {
    final double width = isIpad ? 0.8.sw : 1.sw;
    return Center(
      child: SizedBox(
        width: width,
        child: this,
      ),
    );
  }
}
