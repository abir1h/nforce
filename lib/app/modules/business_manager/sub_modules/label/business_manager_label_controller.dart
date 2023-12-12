import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BusinessManagerLabelController extends GetxController {
  final List<MockLabel> _mockLabel = [];

  List<MockLabel> get mockLabel => _mockLabel;

  void addLabel(MockLabel mockLabel) {
    _mockLabel.add(mockLabel);
    update();
  }

  void updateLabel(MockLabel mockLabel) {
    final index = _mockLabel.indexWhere((element) => element.id == mockLabel.id);
    _mockLabel[index] = mockLabel;
    update();
  }

  void removeLabel(MockLabel mockLabel) {
    _mockLabel.remove(mockLabel);
    update();
  }
}

class MockLabel extends Equatable {
  final String id;
  final String name;
  final String? type;
  final String? description;
  final Color? color;

  const MockLabel({
    required this.id,
    required this.name,
    required this.type,
    required this.description,
    required this.color,
  });

  @override
  List<Object?> get props => [id, name, type, color, description];
}
