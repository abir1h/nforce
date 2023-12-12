import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BusinessManagerContactGroupController extends GetxController {
  final List<MockContactGroup> _mockContactGroup = [];

  List<MockContactGroup> get mockContactGroup => _mockContactGroup;

  void addContactGroup(MockContactGroup mockContactGroup) {
    _mockContactGroup.add(mockContactGroup);
    update();
  }

  void updateContactGroup(MockContactGroup mockContactGroup) {
    final index = _mockContactGroup.indexWhere((element) => element.id == mockContactGroup.id);
    _mockContactGroup[index] = mockContactGroup;
    update();
  }

  void removeContactGroup(MockContactGroup mockContactGroup) {
    _mockContactGroup.remove(mockContactGroup);
    update();
  }
}

class MockContactGroup extends Equatable {
  final String id;
  final String name;
  final String? for_;
  final String? description;
  final Color? color;

  const MockContactGroup({
    required this.id,
    required this.name,
    required this.for_,
    required this.description,
    required this.color,
  });

  @override
  List<Object?> get props => [id, name, for_, color, description];
}
