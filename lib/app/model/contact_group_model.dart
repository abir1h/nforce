class ContactGroupModel {
  final int? page;
  final int? limit;
  final int? totalCount;
  final int? pageCount;
  final int? nextPage;
  final int? prevPage;
  final List<int>? pageChunks;
  final List<ContactGroup>? data;
  final int? count;

  ContactGroupModel({
    this.page,
    this.limit,
    this.totalCount,
    this.pageCount,
    this.nextPage,
    this.prevPage,
    this.pageChunks,
    this.data,
    this.count,
  });

  ContactGroupModel copyWith({
    int? page,
    int? limit,
    int? totalCount,
    int? pageCount,
    int? nextPage,
    int? prevPage,
    List<int>? pageChunks,
    List<ContactGroup>? data,
    int? count,
  }) =>
      ContactGroupModel(
        page: page ?? this.page,
        limit: limit ?? this.limit,
        totalCount: totalCount ?? this.totalCount,
        pageCount: pageCount ?? this.pageCount,
        nextPage: nextPage ?? this.nextPage,
        prevPage: prevPage ?? this.prevPage,
        pageChunks: pageChunks ?? this.pageChunks,
        data: data ?? this.data,
        count: count ?? this.count,
      );

  factory ContactGroupModel.fromJson(Map<String, dynamic> json) => ContactGroupModel(
        page: json["page"],
        limit: json["limit"],
        totalCount: json["totalCount"],
        pageCount: json["pageCount"],
        nextPage: json["nextPage"],
        prevPage: json["prevPage"],
        pageChunks: json["pageChunks"] == null ? [] : List<int>.from(json["pageChunks"]!.map((x) => x)),
        data: json["data"] == null ? [] : List<ContactGroup>.from(json["data"]!.map((x) => ContactGroup.fromJson(x))),
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
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
        "count": count,
      };
}

class ContactGroup {
  final int? id;
  final int? businessId;
  final String? groupType;
  final String? groupCode;
  final String? paramsOrgCode;
  final String? name;
  final dynamic parentId;

  ContactGroup({
    this.id,
    this.businessId,
    this.groupType,
    this.groupCode,
    this.paramsOrgCode,
    this.name,
    this.parentId,
  });

  ContactGroup copyWith({
    int? id,
    int? businessId,
    String? groupType,
    String? groupCode,
    String? paramsOrgCode,
    String? name,
    dynamic parentId,
  }) =>
      ContactGroup(
        id: id ?? this.id,
        businessId: businessId ?? this.businessId,
        groupType: groupType ?? this.groupType,
        groupCode: groupCode ?? this.groupCode,
        paramsOrgCode: paramsOrgCode ?? this.paramsOrgCode,
        name: name ?? this.name,
        parentId: parentId ?? this.parentId,
      );

  factory ContactGroup.fromJson(Map<String, dynamic> json) => ContactGroup(
        id: json["id"],
        businessId: json["businessId"],
        groupType: json["groupType"],
        groupCode: json["groupCode"],
        paramsOrgCode: json["paramsOrgCode"],
        name: json["name"],
        parentId: json["parentId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "businessId": businessId,
        "groupType": groupType,
        "groupCode": groupCode,
        "paramsOrgCode": paramsOrgCode,
        "name": name,
        "parentId": parentId,
      };
}

class Data {
  final String? groupType;

  Data({this.groupType});

  Data copyWith({String? groupType}) => Data(groupType: groupType ?? this.groupType);

  factory Data.fromJson(Map<String, dynamic> json) => Data(groupType: json["groupType"]);

  Map<String, dynamic> toJson() => {"groupType": groupType};
}
