import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

class Agent extends Equatable {
  final int id;
  final String name;
  final String image;
  final String status;
  final Color color;

  const Agent({
    required this.id,
    required this.name,
    required this.image,
    required this.status,
    required this.color,
  });

  @override
  List<Object?> get props => [id, name, image, status, color];
}
