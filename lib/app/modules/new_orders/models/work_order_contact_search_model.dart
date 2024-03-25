class WorkOrderContactSearch {
  final int? id;
  final int? businessId;
  final dynamic userId;
  final String? userType;
  final dynamic owner;
  final String? name;
  final int? groupId;
  final String? refCode;
  final int? qbid;
  final dynamic photoUrl;
  final String? details;
  final dynamic tags;
  final dynamic params;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  WorkOrderContactSearch({
    this.id,
    this.businessId,
    this.userId,
    this.userType,
    this.owner,
    this.name,
    this.groupId,
    this.refCode,
    this.qbid,
    this.photoUrl,
    this.details,
    this.tags,
    this.params,
    this.createdAt,
    this.updatedAt,
  });

  WorkOrderContactSearch copyWith({
    int? id,
    int? businessId,
    dynamic userId,
    String? userType,
    dynamic owner,
    String? name,
    int? groupId,
    String? refCode,
    int? qbid,
    dynamic photoUrl,
    String? details,
    dynamic tags,
    dynamic params,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      WorkOrderContactSearch(
        id: id ?? this.id,
        businessId: businessId ?? this.businessId,
        userId: userId ?? this.userId,
        userType: userType ?? this.userType,
        owner: owner ?? this.owner,
        name: name ?? this.name,
        groupId: groupId ?? this.groupId,
        refCode: refCode ?? this.refCode,
        qbid: qbid ?? this.qbid,
        photoUrl: photoUrl ?? this.photoUrl,
        details: details ?? this.details,
        tags: tags ?? this.tags,
        params: params ?? this.params,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory WorkOrderContactSearch.fromJson(Map<String, dynamic> json) => WorkOrderContactSearch(
        id: json["id"],
        businessId: json["business_id"],
        userId: json["user_id"],
        userType: json["user_type"],
        owner: json["owner"],
        name: json["name"],
        groupId: json["group_id"],
        refCode: json["ref_code"],
        qbid: json["qbid"],
        photoUrl: json["photo_url"],
        details: json["details"],
        tags: json["tags"],
        params: json["params"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "business_id": businessId,
        "user_id": userId,
        "user_type": userType,
        "owner": owner,
        "name": name,
        "group_id": groupId,
        "ref_code": refCode,
        "qbid": qbid,
        "photo_url": photoUrl,
        "details": details,
        "tags": tags,
        "params": params,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
