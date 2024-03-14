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

  LineItem copyWith({
    int? id,
    String? itemType,
    String? name,
    String? description,
    String? unitPrice,
    String? discount,
    String? quantity,
    String? totoalBill,
  }) {
    return LineItem(
      id: id ?? this.id,
      itemType: itemType ?? this.itemType,
      name: name ?? this.name,
      description: description ?? this.description,
      unitPrice: unitPrice ?? this.unitPrice,
      discount: discount ?? this.discount,
      quantity: quantity ?? this.quantity,
      totoalBill: totoalBill ?? this.totoalBill,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'itemType': itemType,
      'name': name,
      'description': description,
      'unitPrice': unitPrice,
      'discount': discount,
      'quantity': quantity,
      'totoalBill': totoalBill,
    };
  }

  @override
  List<Object?> get props => [id, itemType, name, description, unitPrice, discount, quantity, totoalBill];
}
