// To parse this JSON data, do
//
//     final serviceManegerDataModel = serviceManegerDataModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ServiceManagerDataModel serviceManegerDataModelFromJson(String str) => ServiceManagerDataModel.fromJson(json.decode(str));

String serviceManegerDataModelToJson(ServiceManagerDataModel data) => json.encode(data.toJson());

class ServiceManagerDataModel {
  final int page;
  final int limit;
  final int totalCount;
  final int pageCount;
  final int nextPage;
  final int prevPage;
  final List<int>? pageChunks;
  final List<ServiceMangerItemModel>? data;
  final int count;
  final List<Columns>? columns;
  final List<Filter>? filters;

  ServiceManagerDataModel({
    required this.page,
    required this.limit,
    required this.totalCount,
    required this.pageCount,
    required this.nextPage,
    required this.prevPage,
    required this.pageChunks,
    required this.data,
    required this.count,
    required this.columns,
    required this.filters,
  });

  ServiceManagerDataModel copyWith({
    int? page,
    int? limit,
    int? totalCount,
    int? pageCount,
    int? nextPage,
    int? prevPage,
    List<int>? pageChunks,
    List<ServiceMangerItemModel>? data,
    int? count,
    List<Columns>? columns,
    List<Filter>? filters,
  }) =>
      ServiceManagerDataModel(
        page: page ?? this.page,
        limit: limit ?? this.limit,
        totalCount: totalCount ?? this.totalCount,
        pageCount: pageCount ?? this.pageCount,
        nextPage: nextPage ?? this.nextPage,
        prevPage: prevPage ?? this.prevPage,
        pageChunks: pageChunks ?? this.pageChunks,
        data: data ?? this.data,
        count: count ?? this.count,
        columns: columns ?? this.columns,
        filters: filters ?? this.filters,
      );

  factory ServiceManagerDataModel.fromJson(Map<String, dynamic> json) => ServiceManagerDataModel(
    page: json["page"],
    limit: json["limit"],
    totalCount: json["totalCount"],
    pageCount: json["pageCount"],
    nextPage: json["nextPage"],
    prevPage: json["prevPage"],
    pageChunks: json["pageChunks"]==null?[]:List<int>.from(json["pageChunks"].map((x) => x)),
    data: json["data"]==null?[]:List<ServiceMangerItemModel>.from(json["data"].map((x) => ServiceMangerItemModel.fromJson(x))),
    count: json["count"],
    columns: json["columns"]==null?[]:List<Columns>.from(json["columns"].map((x) => Columns.fromJson(x))),
    filters: json["filters"]==null?[]:List<Filter>.from(json["filters"].map((x) => Filter.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "page": page,
    "limit": limit,
    "totalCount": totalCount,
    "pageCount": pageCount,
    "nextPage": nextPage,
    "prevPage": prevPage,
    "pageChunks": List<dynamic>.from(pageChunks!.map((x) => x)),
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    "count": count,
    "columns": List<dynamic>.from(columns!.map((x) => x.toJson())),
    "filters": List<dynamic>.from(filters!.map((x) => x.toJson())),
  };
}

class Columns {
  final String key;
  final bool hidden;
  final String label;
  final int order;
  final String name;
  final String description;

  Columns({
    required this.key,
    required this.hidden,
    required this.label,
    required this.order,
    required this.name,
    required this.description,
  });

  Columns copyWith({
    String? key,
    bool? hidden,
    String? label,
    int? order,
    String? name,
    String? description,
  }) =>
      Columns(
        key: key ?? this.key,
        hidden: hidden ?? this.hidden,
        label: label ?? this.label,
        order: order ?? this.order,
        name: name ?? this.name,
        description: description ?? this.description,
      );

  factory Columns.fromJson(Map<String, dynamic> json) => Columns(
    key: json["key"]??"",
    hidden: json["hidden"]??false,
    label: json["label"]??"",
    order: json["order"]??-1,
    name: json["name"]??"",
    description: json["description"]??"",
  );

  Map<String, dynamic> toJson() => {
    "key": key,
    "hidden": hidden,
    "label": label,
    "order": order,
    "name": name,
    "description": description,
  };
}

class ServiceMangerItemModel {
  final int id;
  final int businessId;
  final dynamic owner;
  final String priceChart;
  final String itemType;
  final String itemCode;
  final dynamic sku;
  final dynamic invoiceId;
  final int categoryId;
  final String name;
  final String description;
  final int displayOrder;
  final int unitCost;
  final String unitMetric;
  final int quantity;
  final String discount;
  final int footerItem;
  final int inPercent;
  final int billedItem;
  final Details? details;
  final ServiceMangerItemModelParams? params;
  final dynamic qbid;
  final dynamic thumbUrl;
  final int totalCost;
  final dynamic discountAmount;
  final bool isDiscountApplicable;
  final bool isBilledItem;
  final dynamic ownerType;
  final dynamic invoiceNo;
  final String categoryName;
  final String status;
  final int locked;
  final dynamic parentId;
  final DateTime createdAt;
  final DateTime updatedAt;

  ServiceMangerItemModel({
    required this.id,
    required this.businessId,
    required this.owner,
    required this.priceChart,
    required this.itemType,
    required this.itemCode,
    required this.sku,
    required this.invoiceId,
    required this.categoryId,
    required this.name,
    required this.description,
    required this.displayOrder,
    required this.unitCost,
    required this.unitMetric,
    required this.quantity,
    required this.discount,
    required this.footerItem,
    required this.inPercent,
    required this.billedItem,
    required this.details,
    required this.params,
    required this.qbid,
    required this.thumbUrl,
    required this.totalCost,
    required this.discountAmount,
    required this.isDiscountApplicable,
    required this.isBilledItem,
    required this.ownerType,
    required this.invoiceNo,
    required this.categoryName,
    required this.status,
    required this.locked,
    required this.parentId,
    required this.createdAt,
    required this.updatedAt,
  });

  ServiceMangerItemModel copyWith({
    int? id,
    int? businessId,
    dynamic owner,
    String? priceChart,
    String? itemType,
    String? itemCode,
    dynamic sku,
    dynamic invoiceId,
    int? categoryId,
    String? name,
    String? description,
    int? displayOrder,
    int? unitCost,
    String? unitMetric,
    int? quantity,
    String? discount,
    int? footerItem,
    int? inPercent,
    int? billedItem,
    Details? details,
    ServiceMangerItemModelParams? params,
    dynamic qbid,
    dynamic thumbUrl,
    int? totalCost,
    dynamic discountAmount,
    bool? isDiscountApplicable,
    bool? isBilledItem,
    dynamic ownerType,
    dynamic invoiceNo,
    String? categoryName,
    String? status,
    int? locked,
    dynamic parentId,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      ServiceMangerItemModel(
        id: id ?? this.id,
        businessId: businessId ?? this.businessId,
        owner: owner ?? this.owner,
        priceChart: priceChart ?? this.priceChart,
        itemType: itemType ?? this.itemType,
        itemCode: itemCode ?? this.itemCode,
        sku: sku ?? this.sku,
        invoiceId: invoiceId ?? this.invoiceId,
        categoryId: categoryId ?? this.categoryId,
        name: name ?? this.name,
        description: description ?? this.description,
        displayOrder: displayOrder ?? this.displayOrder,
        unitCost: unitCost ?? this.unitCost,
        unitMetric: unitMetric ?? this.unitMetric,
        quantity: quantity ?? this.quantity,
        discount: discount ?? this.discount,
        footerItem: footerItem ?? this.footerItem,
        inPercent: inPercent ?? this.inPercent,
        billedItem: billedItem ?? this.billedItem,
        details: details ?? this.details,
        params: params ?? this.params,
        qbid: qbid ?? this.qbid,
        thumbUrl: thumbUrl ?? this.thumbUrl,
        totalCost: totalCost ?? this.totalCost,
        discountAmount: discountAmount ?? this.discountAmount,
        isDiscountApplicable: isDiscountApplicable ?? this.isDiscountApplicable,
        isBilledItem: isBilledItem ?? this.isBilledItem,
        ownerType: ownerType ?? this.ownerType,
        invoiceNo: invoiceNo ?? this.invoiceNo,
        categoryName: categoryName ?? this.categoryName,
        status: status ?? this.status,
        locked: locked ?? this.locked,
        parentId: parentId ?? this.parentId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory ServiceMangerItemModel.fromJson(Map<String, dynamic> json) => ServiceMangerItemModel(
    id: json["id"]??-1,
    businessId: json["business_id"]??-1,
    owner: json["owner"],
    priceChart: json["price_chart"]??"",
    itemType: json["item_type"]??"",
    itemCode: json["item_code"]??"",
    sku: json["sku"]??"",
    invoiceId: json["invoice_id"]??-1,
    categoryId: json["category_id"]??-1,
    name: json["name"]??"",
    description: json["description"]??"",
    displayOrder: json["display_order"]??-1,
    unitCost: json["unit_cost"]??-1,
    unitMetric: json["unit_metric"]??"",
    quantity: json["quantity"]??-1,
    discount: json["discount"]??"",
    footerItem: json["footer_item"]??-1,
    inPercent: json["in_percent"]??-1,
    billedItem: json["billed_item"]??-1,
    details: json["details"]==null?null:Details.fromJson(json["details"]),
    params: json["params"]==null?null:ServiceMangerItemModelParams.fromJson(json["params"]),
    qbid: json["qbid"]??"",
    thumbUrl: json["thumb_url"]??"",
    totalCost: json["total_cost"]??-1,
    discountAmount: json["discount_amount"]??-1,
    isDiscountApplicable: json["is_discount_applicable"]??false,
    isBilledItem: json["is_billed_item"]??false,
    ownerType: json["owner_type"]??"",
    invoiceNo: json["invoice_no"]??"",
    categoryName: json["category_name"]??"",
    status: json["status"]??"",
    locked: json["locked"]??-1,
    parentId: json["parent_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "business_id": businessId,
    "owner": owner,
    "price_chart": priceChart,
    "item_type": itemType,
    "item_code": itemCode,
    "sku": sku,
    "invoice_id": invoiceId,
    "category_id": categoryId,
    "name": name,
    "description": description,
    "display_order": displayOrder,
    "unit_cost": unitCost,
    "unit_metric": unitMetric,
    "quantity": quantity,
    "discount": discount,
    "footer_item": footerItem,
    "in_percent": inPercent,
    "billed_item": billedItem,
    "details": details?.toJson(),
    "params": params?.toJson(),
    "qbid": qbid,
    "thumb_url": thumbUrl,
    "total_cost": totalCost,
    "discount_amount": discountAmount,
    "is_discount_applicable": isDiscountApplicable,
    "is_billed_item": isBilledItem,
    "owner_type": ownerType,
    "invoice_no": invoiceNo,
    "category_name": categoryName,
    "status": status,
    "locked": locked,
    "parent_id": parentId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

class Details {
  final String quantityNotApplicable;
  final dynamic notes;
  final String discountNotes;
  final dynamic taxable;
  final dynamic photoUrl;
  final dynamic quantityStep;
  final dynamic unitMetricPlural;
  final dynamic costMutation;
  final dynamic costMutationFactor;
  final dynamic salesTaxIncluded;

  Details({
    required this.quantityNotApplicable,
    required this.notes,
    required this.discountNotes,
    required this.taxable,
    required this.photoUrl,
    required this.quantityStep,
    required this.unitMetricPlural,
    required this.costMutation,
    required this.costMutationFactor,
    required this.salesTaxIncluded,
  });

  Details copyWith({
    String? quantityNotApplicable,
    dynamic notes,
    String? discountNotes,
    dynamic taxable,
    dynamic photoUrl,
    dynamic quantityStep,
    dynamic unitMetricPlural,
    dynamic costMutation,
    dynamic costMutationFactor,
    dynamic salesTaxIncluded,
  }) =>
      Details(
        quantityNotApplicable: quantityNotApplicable ?? this.quantityNotApplicable,
        notes: notes ?? this.notes,
        discountNotes: discountNotes ?? this.discountNotes,
        taxable: taxable ?? this.taxable,
        photoUrl: photoUrl ?? this.photoUrl,
        quantityStep: quantityStep ?? this.quantityStep,
        unitMetricPlural: unitMetricPlural ?? this.unitMetricPlural,
        costMutation: costMutation ?? this.costMutation,
        costMutationFactor: costMutationFactor ?? this.costMutationFactor,
        salesTaxIncluded: salesTaxIncluded ?? this.salesTaxIncluded,
      );

  factory Details.fromJson(Map<String, dynamic> json) => Details(
    quantityNotApplicable: json["quantity_not_applicable"]??"",
    notes: json["notes"]??"",
    discountNotes: json["discount_notes"]??"",
    taxable: json["taxable"]??"",
    photoUrl: json["photo_url"]??"",
    quantityStep: json["quantity_step"]??"",
    unitMetricPlural: json["unit_metric_plural"]??"",
    costMutation: json["cost_mutation"]??"",
    costMutationFactor: json["cost_mutation_factor"]??"",
    salesTaxIncluded: json["sales_tax_included"]??"",
  );

  Map<String, dynamic> toJson() => {
    "quantity_not_applicable": quantityNotApplicable,
    "notes": notes,
    "discount_notes": discountNotes,
    "taxable": taxable,
    "photo_url": photoUrl,
    "quantity_step": quantityStep,
    "unit_metric_plural": unitMetricPlural,
    "cost_mutation": costMutation,
    "cost_mutation_factor": costMutationFactor,
    "sales_tax_included": salesTaxIncluded,
  };
}

class ServiceMangerItemModelParams {
  final String orgCode;

  ServiceMangerItemModelParams({
    required this.orgCode,
  });

  ServiceMangerItemModelParams copyWith({
    String? orgCode,
  }) =>
      ServiceMangerItemModelParams(
        orgCode: orgCode ?? this.orgCode,
      );

  factory ServiceMangerItemModelParams.fromJson(Map<String, dynamic> json) => ServiceMangerItemModelParams(
    orgCode: json["org_code"]??"",
  );

  Map<String, dynamic> toJson() => {
    "org_code": orgCode,
  };
}

class Filter {
  final String name;
  final String key;
  final String label;
  final int order;
  final bool readonly;
  final bool actions;
  final String editor;
  final List<dynamic>? validators;
  final FilterParams? params;
  final dynamic value;
  final List<Option>? options;

  Filter({
    required this.name,
    required this.key,
    required this.label,
    required this.order,
    required this.readonly,
    required this.actions,
    required this.editor,
    required this.validators,
    required this.params,
    required this.value,
    required this.options,
  });

  Filter copyWith({
    String? name,
    String? key,
    String? label,
    int? order,
    bool? readonly,
    bool? actions,
    String? editor,
    List<dynamic>? validators,
    FilterParams? params,
    dynamic value,
    List<Option>? options,
  }) =>
      Filter(
        name: name ?? this.name,
        key: key ?? this.key,
        label: label ?? this.label,
        order: order ?? this.order,
        readonly: readonly ?? this.readonly,
        actions: actions ?? this.actions,
        editor: editor ?? this.editor,
        validators: validators ?? this.validators,
        params: params ?? this.params,
        value: value ?? this.value,
        options: options ?? this.options,
      );

  factory Filter.fromJson(Map<String, dynamic> json) => Filter(
    name: json["name"]??"",
    key: json["key"]??"",
    label: json["label"]??"",
    order: json["order"]??-1,
    readonly: json["readonly"]??false,
    actions: json["actions"]??false,
    editor: json["editor"]??"",
    validators:  json["validators"]==null?[]:List<dynamic>.from(json["validators"].map((x) => x)),
    params:json["params"]==null?null:FilterParams.fromJson(json["params"]),
    value: json["value"],
    options: json["options"]==null?[]:List<Option>.from(json["options"].map((x) => Option.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "key": key,
    "label": label,
    "order": order,
    "readonly": readonly,
    "actions": actions,
    "editor": editor,
    "validators": List<dynamic>.from(validators!.map((x) => x)),
    "params": params!.toJson(),
    "value": value,
    "options": List<dynamic>.from(options!.map((x) => x.toJson())),
  };
}

class Option {
  final String label;
  final int value;

  Option({
    required this.label,
    required this.value,
  });

  Option copyWith({
    String? label,
    int? value,
  }) =>
      Option(
        label: label ?? this.label,
        value: value ?? this.value,
      );

  factory Option.fromJson(Map<String, dynamic> json) => Option(
    label: json["label"]??"",
    value: json["value"]??"",
  );

  Map<String, dynamic> toJson() => {
    "label": label,
    "value": value,
  };
}

class FilterParams {
  final String type;
  final String paramsClass;

  FilterParams({
    required this.type,
    required this.paramsClass,
  });

  FilterParams copyWith({
    String? type,
    String? paramsClass,
  }) =>
      FilterParams(
        type: type ?? this.type,
        paramsClass: paramsClass ?? this.paramsClass,
      );

  factory FilterParams.fromJson(Map<String, dynamic> json) => FilterParams(
    type: json["type"]??"",
    paramsClass: json["class"]??"",
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "class": paramsClass,
  };
}
