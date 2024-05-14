import 'package:flutter/material.dart';

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
