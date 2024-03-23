import 'package:equatable/equatable.dart';

class LineItem extends Equatable {
  final int id;
  final String itemType;
  final String name;
  final String description;
  final String unitPrice;
  final String discount;
  final String quantity;
  final String totoalBill;

  const LineItem({
    required this.id,
    required this.itemType,
    required this.name,
    required this.description,
    required this.unitPrice,
    required this.discount,
    required this.quantity,
    required this.totoalBill,
  });

  @override
  List<Object?> get props => [id, itemType, name, description, unitPrice, discount, quantity, totoalBill];
}
