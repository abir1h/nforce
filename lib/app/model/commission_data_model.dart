class CommissionDataModel {
  final int? page;
  final int? limit;
  final int? totalCount;
  final int? pageCount;
  final int? nextPage;
  final int? prevPage;
  final List<int>? pageChunks;
  final List<Commission>? commission;
  final int? count;

  CommissionDataModel({
    this.page,
    this.limit,
    this.totalCount,
    this.pageCount,
    this.nextPage,
    this.prevPage,
    this.pageChunks,
    this.commission,
    this.count,
  });

  CommissionDataModel copyWith({
    int? page,
    int? limit,
    int? totalCount,
    int? pageCount,
    int? nextPage,
    int? prevPage,
    List<int>? pageChunks,
    List<Commission>? data,
    int? count,
  }) =>
      CommissionDataModel(
        page: page ?? this.page,
        limit: limit ?? this.limit,
        totalCount: totalCount ?? this.totalCount,
        pageCount: pageCount ?? this.pageCount,
        nextPage: nextPage ?? this.nextPage,
        prevPage: prevPage ?? this.prevPage,
        pageChunks: pageChunks ?? this.pageChunks,
        commission: data ?? commission,
        count: count ?? this.count,
      );

  factory CommissionDataModel.fromJson(Map<String, dynamic> json) => CommissionDataModel(
        page: json["page"],
        limit: json["limit"],
        totalCount: json["totalCount"],
        pageCount: json["pageCount"],
        nextPage: json["nextPage"],
        prevPage: json["prevPage"],
        pageChunks: json["pageChunks"] == null ? [] : List<int>.from(json["pageChunks"]!.map((x) => x)),
        commission: json["data"] == null ? [] : List<Commission>.from(json["data"]!.map((x) => Commission.fromJson(x))),
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "limit": limit,
        "totalCount": totalCount,
        "pageCount": pageCount,
        "nextPage": nextPage,
        "prevPage": prevPage,
        "pageChunks": pageChunks == null ? [] : List<dynamic>.from(pageChunks!.map((x) => x)),
        "data": commission == null ? [] : List<dynamic>.from(commission!.map((x) => x.toJson())),
        "count": count,
      };
}

class Commission {
  final int? id;
  final int? businessId;
  final String? groupType;
  final String? groupCode;
  final String? name;
  final String? detailsDefaultValue;
  final String? detailsInitialValue;

  Commission({
    this.id,
    this.businessId,
    this.groupType,
    this.groupCode,
    this.name,
    this.detailsDefaultValue,
    this.detailsInitialValue,
  });

  Commission copyWith({
    int? id,
    int? businessId,
    String? groupType,
    String? groupCode,
    String? name,
    String? detailsDefaultValue,
    String? detailsInitialValue,
  }) =>
      Commission(
        id: id ?? this.id,
        businessId: businessId ?? this.businessId,
        groupType: groupType ?? this.groupType,
        groupCode: groupCode ?? this.groupCode,
        name: name ?? this.name,
        detailsDefaultValue: detailsDefaultValue ?? this.detailsDefaultValue,
        detailsInitialValue: detailsInitialValue ?? this.detailsInitialValue,
      );

  factory Commission.fromJson(Map<String, dynamic> json) => Commission(
        id: json["id"],
        businessId: json["businessId"],
        groupType: json["groupType"],
        groupCode: json["groupCode"],
        name: json["name"],
        detailsDefaultValue: json["detailsDefaultValue"],
        detailsInitialValue: json["detailsInitialValue"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "businessId": businessId,
        "groupType": groupType,
        "groupCode": groupCode,
        "name": name,
        "detailsDefaultValue": detailsDefaultValue,
        "detailsInitialValue": detailsInitialValue,
      };
}
