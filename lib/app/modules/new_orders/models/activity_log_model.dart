class ActivityLogDataModel {
  final int page;
  final int limit;
  final int totalCount;
  final int pageCount;
  final int nextPage;
  final int prevPage;
  final List<int>? pageChunks;
  final List<ActivityListData>? data;
  final int count;
  final List<column>? columns;

  ActivityLogDataModel({
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
  });

  ActivityLogDataModel copyWith({
    int? page,
    int? limit,
    int? totalCount,
    int? pageCount,
    int? nextPage,
    int? prevPage,
    List<int>? pageChunks,
    List<ActivityListData>? data,
    int? count,
    List<column>? columns,
  }) =>
      ActivityLogDataModel(
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
      );

  factory ActivityLogDataModel.fromJson(Map<String, dynamic> json) => ActivityLogDataModel(
        page: json["page"],
        limit: json["limit"],
        totalCount: json["totalCount"],
        pageCount: json["pageCount"],
        nextPage: json["nextPage"],
        prevPage: json["prevPage"],
        pageChunks: json["pageChunks"] == null ? [] : List<int>.from(json["pageChunks"].map((x) => x)),
        data: json["data"] == null ? [] : List<ActivityListData>.from(json["data"].map((x) => ActivityListData.fromJson(x))),
        count: json["count"],
        columns: json["columns"] == null ? [] : List<column>.from(json["columns"].map((x) => column.fromJson(x))),
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
      };
}

class column {
  final String key;
  final bool hidden;
  final String label;
  final int order;
  final String name;
  final String description;

  column({required this.key, required this.hidden, required this.label, required this.order, required this.name, required this.description});

  column copyWith({String? key, bool? hidden, String? label, int? order, String? name, String? description}) => column(
        key: key ?? this.key,
        hidden: hidden ?? this.hidden,
        label: label ?? this.label,
        order: order ?? this.order,
        name: name ?? this.name,
        description: description ?? this.description,
      );

  factory column.fromJson(Map<String, dynamic> json) => column(
        key: json["key"],
        hidden: json["hidden"],
        label: json["label"],
        order: json["order"],
        name: json["name"],
        description: json["description"],
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

class ActivityListData {
  final int id;
  final int businessId;
  final int userId;
  final String owner;
  final dynamic context;
  final String action;
  final String resulted;
  final String description;
  final String affectedObjectType;
  final int affectedObjectId;
  final String priority;
  final Data? data;
  final Details? details;
  final dynamic detailsOwnerName;
  final String detailsDisplayName;
  final String detailsBusinessName;
  final String detailsOrgCode;
  final String detailsUserName;
  final dynamic url;
  final DateTime logDate;
  final DateTime logAt;
  final PreviousState? previousState;
  final String createdAt;
  final String updatedAt;

  ActivityListData({
    required this.id,
    required this.businessId,
    required this.userId,
    required this.owner,
    required this.context,
    required this.action,
    required this.resulted,
    required this.description,
    required this.affectedObjectType,
    required this.affectedObjectId,
    required this.priority,
    required this.data,
    required this.details,
    required this.detailsOwnerName,
    required this.detailsDisplayName,
    required this.detailsBusinessName,
    required this.detailsOrgCode,
    required this.detailsUserName,
    required this.url,
    required this.logDate,
    required this.logAt,
    required this.previousState,
    required this.createdAt,
    required this.updatedAt,
  });

  ActivityListData copyWith({
    int? id,
    int? businessId,
    int? userId,
    String? owner,
    dynamic context,
    String? action,
    String? resulted,
    String? description,
    String? affectedObjectType,
    int? affectedObjectId,
    String? priority,
    Data? data,
    Details? details,
    dynamic detailsOwnerName,
    String? detailsDisplayName,
    String? detailsBusinessName,
    String? detailsOrgCode,
    String? detailsUserName,
    dynamic url,
    DateTime? logDate,
    DateTime? logAt,
    PreviousState? previousState,
    String? createdAt,
    String? updatedAt,
  }) =>
      ActivityListData(
        id: id ?? this.id,
        businessId: businessId ?? this.businessId,
        userId: userId ?? this.userId,
        owner: owner ?? this.owner,
        context: context ?? this.context,
        action: action ?? this.action,
        resulted: resulted ?? this.resulted,
        description: description ?? this.description,
        affectedObjectType: affectedObjectType ?? this.affectedObjectType,
        affectedObjectId: affectedObjectId ?? this.affectedObjectId,
        priority: priority ?? this.priority,
        data: data ?? this.data,
        details: details ?? this.details,
        detailsOwnerName: detailsOwnerName ?? this.detailsOwnerName,
        detailsDisplayName: detailsDisplayName ?? this.detailsDisplayName,
        detailsBusinessName: detailsBusinessName ?? this.detailsBusinessName,
        detailsOrgCode: detailsOrgCode ?? this.detailsOrgCode,
        detailsUserName: detailsUserName ?? this.detailsUserName,
        url: url ?? this.url,
        logDate: logDate ?? this.logDate,
        logAt: logAt ?? this.logAt,
        previousState: previousState ?? this.previousState,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory ActivityListData.fromJson(Map<String, dynamic> json) => ActivityListData(
        id: json["id"] ?? -1,
        businessId: json["businessId"] ?? -1,
        userId: json["userId"] ?? -1,
        owner: json["owner"] ?? "",
        context: json["context"] ?? "",
        action: json["action"] ?? "",
        resulted: json["resulted"] ?? "",
        description: json["description"] ?? "",
        affectedObjectType: json["affectedObjectType"] ?? "",
        affectedObjectId: json["affectedObjectId"] ?? -1,
        priority: json["priority"] ?? '',
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        details: json["data"] == null ? null : Details.fromJson(json["details"]),
        detailsOwnerName: json["detailsOwnerName"] ?? "",
        detailsDisplayName: json["detailsDisplayName"] ?? "",
        detailsBusinessName: json["detailsBusinessName"] ?? "",
        detailsOrgCode: json["detailsOrgCode"] ?? '',
        detailsUserName: json["detailsUserName"] ?? "",
        url: json["url"] ?? "",
        logDate: DateTime.parse(json["logDate"]),
        logAt: DateTime.parse(json["logAt"]),
        previousState: json["data"] == null ? null : PreviousState.fromJson(json["previous_state"]),
        createdAt: json["createdAt"] ?? "",
        updatedAt: json["updatedAt"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "businessId": businessId,
        "userId": userId,
        "owner": owner,
        "context": context,
        "action": action,
        "resulted": resulted,
        "description": description,
        "affectedObjectType": affectedObjectType,
        "affectedObjectId": affectedObjectId,
        "priority": priority,
        "data": data?.toJson(),
        "details": details?.toJson(),
        "detailsOwnerName": detailsOwnerName,
        "detailsDisplayName": detailsDisplayName,
        "detailsBusinessName": detailsBusinessName,
        "detailsOrgCode": detailsOrgCode,
        "detailsUserName": detailsUserName,
        "url": url,
        "logDate": "${logDate.year.toString().padLeft(4, '0')}-${logDate.month.toString().padLeft(2, '0')}-${logDate.day.toString().padLeft(2, '0')}",
        "logAt": logAt.toIso8601String(),
        "previous_state": previousState?.toJson(),
        "createdAt": createdAt,
        "updatedAt": updatedAt,
      };
}

class Data {
  final String workorderId;
  final int invoiceId;
  final int lineitemId;
  final String quantity;
  final String unitCost;
  final int discount;
  final String description;

  Data({
    required this.workorderId,
    required this.invoiceId,
    required this.lineitemId,
    required this.quantity,
    required this.unitCost,
    required this.discount,
    required this.description,
  });

  Data copyWith({
    String? workorderId,
    int? invoiceId,
    int? lineitemId,
    String? quantity,
    String? unitCost,
    int? discount,
    String? description,
  }) =>
      Data(
        workorderId: workorderId ?? this.workorderId,
        invoiceId: invoiceId ?? this.invoiceId,
        lineitemId: lineitemId ?? this.lineitemId,
        quantity: quantity ?? this.quantity,
        unitCost: unitCost ?? this.unitCost,
        discount: discount ?? this.discount,
        description: description ?? this.description,
      );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        workorderId: json["workorder_id"],
        invoiceId: json["invoice_id"],
        lineitemId: json["lineitem_id"],
        quantity: json["quantity"],
        unitCost: json["unit_cost"],
        discount: json["discount"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "workorder_id": workorderId,
        "invoice_id": invoiceId,
        "lineitem_id": lineitemId,
        "quantity": quantity,
        "unit_cost": unitCost,
        "discount": discount,
        "description": description,
      };
}

class Details {
  final String ownerName;
  final String userName;
  final String businessName;
  final String orgCode;
  final String displayName;

  Details({
    required this.ownerName,
    required this.userName,
    required this.businessName,
    required this.orgCode,
    required this.displayName,
  });

  Details copyWith({
    String? ownerName,
    String? userName,
    String? businessName,
    String? orgCode,
    String? displayName,
  }) =>
      Details(
        ownerName: ownerName ?? this.ownerName,
        userName: userName ?? this.userName,
        businessName: businessName ?? this.businessName,
        orgCode: orgCode ?? this.orgCode,
        displayName: displayName ?? this.displayName,
      );

  factory Details.fromJson(Map<String, dynamic> json) => Details(
        ownerName: json["owner_name"],
        userName: json["user_name"],
        businessName: json["business_name"],
        orgCode: json["org_code"],
        displayName: json["display_name"],
      );

  Map<String, dynamic> toJson() => {
        "owner_name": ownerName,
        "user_name": userName,
        "business_name": businessName,
        "org_code": orgCode,
        "display_name": displayName,
      };
}

class PreviousState {
  final Owner owner;
  final InvoiceId invoiceId;

  PreviousState({
    required this.owner,
    required this.invoiceId,
  });

  PreviousState copyWith({
    Owner? owner,
    InvoiceId? invoiceId,
  }) =>
      PreviousState(
        owner: owner ?? this.owner,
        invoiceId: invoiceId ?? this.invoiceId,
      );

  factory PreviousState.fromJson(Map<String, dynamic> json) => PreviousState(
        owner: Owner.fromJson(json["owner"]),
        invoiceId: InvoiceId.fromJson(json["invoice_id"]),
      );

  Map<String, dynamic> toJson() => {
        "owner": owner.toJson(),
        "invoice_id": invoiceId.toJson(),
      };
}

class Owner {
  final String ownerNew;
  final dynamic previous;

  Owner({
    required this.ownerNew,
    required this.previous,
  });

  Owner copyWith({
    String? ownerNew,
    dynamic previous,
  }) =>
      Owner(
        ownerNew: ownerNew ?? this.ownerNew,
        previous: previous ?? this.previous,
      );

  factory Owner.fromJson(Map<String, dynamic> json) => Owner(
        ownerNew: json["new"],
        previous: json["previous"],
      );

  Map<String, dynamic> toJson() => {
        "new": ownerNew,
        "previous": previous,
      };
}

class InvoiceId {
  final int invoiceIdNew;
  final dynamic previous;

  InvoiceId({
    required this.invoiceIdNew,
    required this.previous,
  });

  InvoiceId copyWith({
    int? invoiceIdNew,
    dynamic previous,
  }) =>
      InvoiceId(
        invoiceIdNew: invoiceIdNew ?? this.invoiceIdNew,
        previous: previous ?? this.previous,
      );

  factory InvoiceId.fromJson(Map<String, dynamic> json) => InvoiceId(
        invoiceIdNew: json["new"],
        previous: json["previous"],
      );

  Map<String, dynamic> toJson() => {
        "new": invoiceIdNew,
        "previous": previous,
      };
}
