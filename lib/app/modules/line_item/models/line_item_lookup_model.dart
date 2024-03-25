class LineItemLookupModel {
  final int? id;
  final String? name;
  final String? cost;
  final String? unitCost;
  final String? itemType;
  final String? itemCode;
  final String? discount;
  final int? quantity;
  final String? description;

  LineItemLookupModel({
    this.id,
    this.name,
    this.cost,
    this.unitCost,
    this.itemType,
    this.itemCode,
    this.discount,
    this.quantity,
    this.description,
  });

  LineItemLookupModel copyWith({
    int? id,
    String? name,
    String? cost,
    String? unitCost,
    String? itemType,
    String? itemCode,
    String? discount,
    int? quantity,
    String? description,
  }) =>
      LineItemLookupModel(
        id: id ?? this.id,
        name: name ?? this.name,
        cost: cost ?? this.cost,
        unitCost: unitCost ?? this.unitCost,
        itemType: itemType ?? this.itemType,
        itemCode: itemCode ?? this.itemCode,
        discount: discount ?? this.discount,
        quantity: quantity ?? this.quantity,
        description: description ?? this.description,
      );

  factory LineItemLookupModel.fromJson(Map<String, dynamic> json) => LineItemLookupModel(
        id: json["id"],
        name: json["name"],
        cost: json["cost"],
        unitCost: json["unit_cost"],
        itemType: json["item_type"],
        itemCode: json["item_code"],
        discount: json["discount"],
        quantity: json["quantity"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "cost": cost,
        "unit_cost": unitCost,
        "item_type": itemType,
        "item_code": itemCode,
        "discount": discount,
        "quantity": quantity,
        "description": description,
      };
}
