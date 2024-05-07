class WorkOrderServicePackageModel {
  final List<ServicePackage>? servicePackage;

  WorkOrderServicePackageModel({
    this.servicePackage,
  });

  WorkOrderServicePackageModel copyWith({
    List<ServicePackage>? data,
  }) =>
      WorkOrderServicePackageModel(
        servicePackage: data ?? servicePackage,
      );

  factory WorkOrderServicePackageModel.fromJson(Map<String, dynamic> json) => WorkOrderServicePackageModel(
        servicePackage: json["data"] == null ? [] : List<ServicePackage>.from(json["data"]!.map((x) => ServicePackage.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": servicePackage == null ? [] : List<dynamic>.from(servicePackage!.map((x) => x.toJson())),
      };
}

class ServicePackage {
  final int? id;
  final int? businessId;
  final String? name;
  final String? serviceType;
  final String? serviceCode;
  final int? parentId;
  final int? displayOrder;
  final String? serviceScope;
  final int? categoryId;
  final String? description;
  final String? photoUrl;
  final String? tags;
  final String? applyDiscount;
  final Details? details;
  final Params? params;
  final int? active;
  final String? status;
  final int? lineItemsCount;
  final int? totalCost;
  final String? categoryName;
  final dynamic topicName;
  final String? thumbUrl;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<String>? policyIds;

  ServicePackage({
    this.id,
    this.businessId,
    this.name,
    this.serviceType,
    this.serviceCode,
    this.parentId,
    this.displayOrder,
    this.serviceScope,
    this.categoryId,
    this.description,
    this.photoUrl,
    this.tags,
    this.applyDiscount,
    this.details,
    this.params,
    this.active,
    this.status,
    this.lineItemsCount,
    this.totalCost,
    this.categoryName,
    this.topicName,
    this.thumbUrl,
    this.createdAt,
    this.updatedAt,
    this.policyIds,
  });

  ServicePackage copyWith({
    int? id,
    int? businessId,
    String? name,
    String? serviceType,
    String? serviceCode,
    int? parentId,
    int? displayOrder,
    String? serviceScope,
    int? categoryId,
    String? description,
    String? photoUrl,
    String? tags,
    String? applyDiscount,
    Details? details,
    Params? params,
    int? active,
    String? status,
    int? lineItemsCount,
    int? totalCost,
    String? categoryName,
    dynamic topicName,
    String? thumbUrl,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<String>? policyIds,
  }) =>
      ServicePackage(
        id: id ?? this.id,
        businessId: businessId ?? this.businessId,
        name: name ?? this.name,
        serviceType: serviceType ?? this.serviceType,
        serviceCode: serviceCode ?? this.serviceCode,
        parentId: parentId ?? this.parentId,
        displayOrder: displayOrder ?? this.displayOrder,
        serviceScope: serviceScope ?? this.serviceScope,
        categoryId: categoryId ?? this.categoryId,
        description: description ?? this.description,
        photoUrl: photoUrl ?? this.photoUrl,
        tags: tags ?? this.tags,
        applyDiscount: applyDiscount ?? this.applyDiscount,
        details: details ?? this.details,
        params: params ?? this.params,
        active: active ?? this.active,
        status: status ?? this.status,
        lineItemsCount: lineItemsCount ?? this.lineItemsCount,
        totalCost: totalCost ?? this.totalCost,
        categoryName: categoryName ?? this.categoryName,
        topicName: topicName ?? this.topicName,
        thumbUrl: thumbUrl ?? this.thumbUrl,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        policyIds: policyIds ?? this.policyIds,
      );

  factory ServicePackage.fromJson(Map<String, dynamic> json) => ServicePackage(
        id: json["id"],
        businessId: json["business_id"],
        name: json["name"],
        serviceType: json["service_type"],
        serviceCode: json["service_code"],
        parentId: json["parent_id"],
        displayOrder: json["display_order"],
        serviceScope: json["service_scope"],
        categoryId: json["category_id"],
        description: json["description"],
        photoUrl: json["photo_url"],
        tags: json["tags"],
        applyDiscount: json["apply_discount"],
        details: json["details"] == null ? null : Details.fromJson(json["details"]),
        params: json["params"] == null ? null : Params.fromJson(json["params"]),
        active: json["active"],
        status: json["status"],
        lineItemsCount: json["line_items_count"],
        totalCost: json["total_cost"],
        categoryName: json["category_name"],
        topicName: json["topic_name"],
        thumbUrl: json["thumb_url"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        policyIds: json["policy_ids"] == null ? [] : List<String>.from(json["policy_ids"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "business_id": businessId,
        "name": name,
        "service_type": serviceType,
        "service_code": serviceCode,
        "parent_id": parentId,
        "display_order": displayOrder,
        "service_scope": serviceScope,
        "category_id": categoryId,
        "description": description,
        "photo_url": photoUrl,
        "tags": tags,
        "apply_discount": applyDiscount,
        "details": details?.toJson(),
        "params": params?.toJson(),
        "active": active,
        "status": status,
        "line_items_count": lineItemsCount,
        "total_cost": totalCost,
        "category_name": categoryName,
        "topic_name": topicName,
        "thumb_url": thumbUrl,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "policy_ids": policyIds == null ? [] : List<dynamic>.from(policyIds!.map((x) => x)),
      };
}

class Details {
  final String? thumbUrl;
  final dynamic taxExempt;
  final String? quoteFirst;
  final String? defaultLabel;
  final String? minPartialPayment;
  final String? cancellationFee;
  final int? totalCost;
  final int? lineItemsCount;
  final dynamic description;
  final dynamic photoUrl;
  final dynamic quote;
  final String? detailsPhotoUrl;

  Details({
    this.thumbUrl,
    this.taxExempt,
    this.quoteFirst,
    this.defaultLabel,
    this.minPartialPayment,
    this.cancellationFee,
    this.totalCost,
    this.lineItemsCount,
    this.description,
    this.photoUrl,
    this.quote,
    this.detailsPhotoUrl,
  });

  Details copyWith({
    String? thumbUrl,
    dynamic taxExempt,
    String? quoteFirst,
    String? defaultLabel,
    String? minPartialPayment,
    String? cancellationFee,
    int? totalCost,
    int? lineItemsCount,
    dynamic description,
    dynamic photoUrl,
    dynamic quote,
    String? detailsPhotoUrl,
  }) =>
      Details(
        thumbUrl: thumbUrl ?? this.thumbUrl,
        taxExempt: taxExempt ?? this.taxExempt,
        quoteFirst: quoteFirst ?? this.quoteFirst,
        defaultLabel: defaultLabel ?? this.defaultLabel,
        minPartialPayment: minPartialPayment ?? this.minPartialPayment,
        cancellationFee: cancellationFee ?? this.cancellationFee,
        totalCost: totalCost ?? this.totalCost,
        lineItemsCount: lineItemsCount ?? this.lineItemsCount,
        description: description ?? this.description,
        photoUrl: photoUrl ?? this.photoUrl,
        quote: quote ?? this.quote,
        detailsPhotoUrl: detailsPhotoUrl ?? this.detailsPhotoUrl,
      );

  factory Details.fromJson(Map<String, dynamic> json) => Details(
        thumbUrl: json["thumb_url"],
        taxExempt: json["tax_exempt"],
        quoteFirst: json["quote_first"],
        defaultLabel: json["default_label"],
        minPartialPayment: json["min_partial_payment"],
        cancellationFee: json["cancellation_fee"],
        totalCost: json["total_cost"],
        lineItemsCount: json["line_items_count"],
        description: json["description"],
        photoUrl: json["photoUrl"],
        quote: json["quote"],
        detailsPhotoUrl: json["photo_url"],
      );

  Map<String, dynamic> toJson() => {
        "thumb_url": thumbUrl,
        "tax_exempt": taxExempt,
        "quote_first": quoteFirst,
        "default_label": defaultLabel,
        "min_partial_payment": minPartialPayment,
        "cancellation_fee": cancellationFee,
        "total_cost": totalCost,
        "line_items_count": lineItemsCount,
        "description": description,
        "photoUrl": photoUrl,
        "quote": quote,
        "photo_url": detailsPhotoUrl,
      };
}

class Params {
  final String? orgCode;

  Params({
    this.orgCode,
  });

  Params copyWith({
    String? orgCode,
  }) =>
      Params(
        orgCode: orgCode ?? this.orgCode,
      );

  factory Params.fromJson(Map<String, dynamic> json) => Params(
        orgCode: json["org_code"],
      );

  Map<String, dynamic> toJson() => {
        "org_code": orgCode,
      };
}
