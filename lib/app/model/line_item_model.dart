import 'package:equatable/equatable.dart';

class LineItem extends Equatable {
  final int id;
  final String unitCost;
  final String quantity;
  final String discount;
  final String details;
  final String totalCost;

  const LineItem({
    required this.id,
    required this.unitCost,
    required this.quantity,
    required this.discount,
    required this.details,
    required this.totalCost,
  });

  LineItem copyWith({
    int? id,
    String? unitCost,
    String? quantity,
    String? discount,
    String? details,
    String? totalCost,
  }) {
    return LineItem(
      id: id ?? this.id,
      unitCost: unitCost ?? this.unitCost,
      quantity: quantity ?? this.quantity,
      discount: discount ?? this.discount,
      details: details ?? this.details,
      totalCost: totalCost ?? this.totalCost,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'unitCost': unitCost,
      'quantity': quantity,
      'discount': discount,
      'details': details,
      'totalCost': totalCost,
    };
  }

  @override
  List<Object?> get props => [id, unitCost, quantity, discount, details, totalCost];
}
