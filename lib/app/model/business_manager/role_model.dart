class RoleModel {
  final int? page;
  final int? limit;
  final int? totalCount;
  final int? pageCount;
  final int? nextPage;
  final int? prevPage;
  final List<int>? pageChunks;
  final List<Role>? data;
  final int? count;
  final List<ColumnOfRole>? columns;
  final List<Action>? actions;
  final List<Tool>? tools;

  RoleModel({
    this.page,
    this.limit,
    this.totalCount,
    this.pageCount,
    this.nextPage,
    this.prevPage,
    this.pageChunks,
    this.data,
    this.count,
    this.columns,
    this.actions,
    this.tools,
  });

  RoleModel copyWith({
    int? page,
    int? limit,
    int? totalCount,
    int? pageCount,
    int? nextPage,
    int? prevPage,
    List<int>? pageChunks,
    List<Role>? data,
    int? count,
    List<ColumnOfRole>? columns,
    List<Action>? actions,
    List<Tool>? tools,
  }) =>
      RoleModel(
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
        actions: actions ?? this.actions,
        tools: tools ?? this.tools,
      );

  factory RoleModel.fromJson(Map<String, dynamic> json) => RoleModel(
        page: json["page"],
        limit: json["limit"],
        totalCount: json["totalCount"],
        pageCount: json["pageCount"],
        nextPage: json["nextPage"],
        prevPage: json["prevPage"],
        pageChunks: json["pageChunks"] == null ? [] : List<int>.from(json["pageChunks"]!.map((x) => x)),
        data: json["data"] == null ? [] : List<Role>.from(json["data"]!.map((x) => Role.fromJson(x))),
        count: json["count"],
        columns: json["columns"] == null ? [] : List<ColumnOfRole>.from(json["columns"]!.map((x) => ColumnOfRole.fromJson(x))),
        actions: json["actions"] == null ? [] : List<Action>.from(json["actions"]!.map((x) => Action.fromJson(x))),
        tools: json["tools"] == null ? [] : List<Tool>.from(json["tools"]!.map((x) => Tool.fromJson(x))),
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
        "columns": columns == null ? [] : List<dynamic>.from(columns!.map((x) => x.toJson())),
        "actions": actions == null ? [] : List<dynamic>.from(actions!.map((x) => x.toJson())),
        "tools": tools == null ? [] : List<dynamic>.from(tools!.map((x) => x.toJson())),
      };
}

class Action {
  final String? label;
  final String? icon;
  final String? routerLink;

  Action({
    this.label,
    this.icon,
    this.routerLink,
  });

  Action copyWith({
    String? label,
    String? icon,
    String? routerLink,
  }) =>
      Action(
        label: label ?? this.label,
        icon: icon ?? this.icon,
        routerLink: routerLink ?? this.routerLink,
      );

  factory Action.fromJson(Map<String, dynamic> json) => Action(
        label: json["label"],
        icon: json["icon"],
        routerLink: json["routerLink"],
      );

  Map<String, dynamic> toJson() => {
        "label": label,
        "icon": icon,
        "routerLink": routerLink,
      };
}

class ColumnOfRole {
  final String? label;
  final String? key;
  final bool? hidden;
  final int? order;
  final String? name;
  final String? description;

  ColumnOfRole({
    this.label,
    this.key,
    this.hidden,
    this.order,
    this.name,
    this.description,
  });

  ColumnOfRole copyWith({
    String? label,
    String? key,
    bool? hidden,
    int? order,
    String? name,
    String? description,
  }) =>
      ColumnOfRole(
        label: label ?? this.label,
        key: key ?? this.key,
        hidden: hidden ?? this.hidden,
        order: order ?? this.order,
        name: name ?? this.name,
        description: description ?? this.description,
      );

  factory ColumnOfRole.fromJson(Map<String, dynamic> json) => ColumnOfRole(
        label: json["label"],
        key: json["key"],
        hidden: json["hidden"],
        order: json["order"],
        name: json["name"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "label": label,
        "key": key,
        "hidden": hidden,
        "order": order,
        "name": name,
        "description": description,
      };
}

class Role {
  final int? id;
  final int? businessId;
  final String? groupType;
  final String? groupCode;
  final String? paramsOrgCode;
  final String? subType;
  final String? name;

  Role({
    this.id,
    this.businessId,
    this.groupType,
    this.groupCode,
    this.paramsOrgCode,
    this.subType,
    this.name,
  });

  Role copyWith({
    int? id,
    int? businessId,
    String? groupType,
    String? groupCode,
    String? paramsOrgCode,
    String? subType,
    String? name,
  }) =>
      Role(
        id: id ?? this.id,
        businessId: businessId ?? this.businessId,
        groupType: groupType ?? this.groupType,
        groupCode: groupCode ?? this.groupCode,
        paramsOrgCode: paramsOrgCode ?? this.paramsOrgCode,
        subType: subType ?? this.subType,
        name: name ?? this.name,
      );

  factory Role.fromJson(Map<String, dynamic> json) => Role(
        id: json["id"],
        businessId: json["businessId"],
        groupType: json["groupType"],
        groupCode: json["groupCode"],
        paramsOrgCode: json["paramsOrgCode"],
        subType: json["subType"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "businessId": businessId,
        "groupType": groupType,
        "groupCode": groupCode,
        "paramsOrgCode": paramsOrgCode,
        "subType": subType,
        "name": name,
      };
}

class Tool {
  final String? label;
  final String? icon;
  final String? action;
  final Data? data;

  Tool({
    this.label,
    this.icon,
    this.action,
    this.data,
  });

  Tool copyWith({
    String? label,
    String? icon,
    String? action,
    Data? data,
  }) =>
      Tool(
        label: label ?? this.label,
        icon: icon ?? this.icon,
        action: action ?? this.action,
        data: data ?? this.data,
      );

  factory Tool.fromJson(Map<String, dynamic> json) => Tool(
        label: json["label"],
        icon: json["icon"],
        action: json["action"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "label": label,
        "icon": icon,
        "action": action,
        "data": data?.toJson(),
      };
}

class Data {
  final String? groupType;

  Data({
    this.groupType,
  });

  Data copyWith({
    String? groupType,
  }) =>
      Data(
        groupType: groupType ?? this.groupType,
      );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        groupType: json["groupType"],
      );

  Map<String, dynamic> toJson() => {
        "groupType": groupType,
      };
}
