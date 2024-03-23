import 'package:flutter/material.dart';

extension TitleCase on String {
  String toTitleCase() {
    return this[0].toUpperCase() + substring(1);
  }
}

extension AddSpacing on num {
  Widget get vSpace => SizedBox(height: toDouble());
  Widget get hSpace => SizedBox(width: toDouble());
}
