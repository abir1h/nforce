class LabelModel {
  final int? page;
  final int? limit;
  final int? totalCount;
  final int? pageCount;
  final int? nextPage;
  final int? prevPage;
  final List<int>? pageChunks;
  final List<Label>? data;
  final int? count;
  final List<Action>? actions;
  final List<Tool>? tools;

  LabelModel({
    this.page,
    this.limit,
    this.totalCount,
    this.pageCount,
    this.nextPage,
    this.prevPage,
    this.pageChunks,
    this.data,
    this.count,
    this.actions,
    this.tools,
  });

  LabelModel copyWith({
    int? page,
    int? limit,
    int? totalCount,
    int? pageCount,
    int? nextPage,
    int? prevPage,
    List<int>? pageChunks,
    List<Label>? data,
    int? count,
    List<Action>? actions,
    List<Tool>? tools,
  }) =>
      LabelModel(
        page: page ?? this.page,
        limit: limit ?? this.limit,
        totalCount: totalCount ?? this.totalCount,
        pageCount: pageCount ?? this.pageCount,
        nextPage: nextPage ?? this.nextPage,
        prevPage: prevPage ?? this.prevPage,
        pageChunks: pageChunks ?? this.pageChunks,
        data: data ?? this.data,
        count: count ?? this.count,
        actions: actions ?? this.actions,
        tools: tools ?? this.tools,
      );

  factory LabelModel.fromJson(Map<String, dynamic> json) => LabelModel(
        page: json["page"],
        limit: json["limit"],
        totalCount: json["totalCount"],
        pageCount: json["pageCount"],
        nextPage: json["nextPage"],
        prevPage: json["prevPage"],
        pageChunks: json["pageChunks"] == null ? [] : List<int>.from(json["pageChunks"]!.map((x) => x)),
        data: json["data"] == null ? [] : List<Label>.from(json["data"]!.map((x) => Label.fromJson(x))),
        count: json["count"],
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
        "actions": actions == null ? [] : List<dynamic>.from(actions!.map((x) => x.toJson())),
        "tools": tools == null ? [] : List<dynamic>.from(tools!.map((x) => x.toJson())),
      };
}

class Action {
  final String? label;
  final String? icon;
  final String? action;
  final String? confirm;
  final String? form;

  Action({
    this.label,
    this.icon,
    this.action,
    this.confirm,
    this.form,
  });

  Action copyWith({
    String? label,
    String? icon,
    String? action,
    String? confirm,
    String? form,
  }) =>
      Action(
        label: label ?? this.label,
        icon: icon ?? this.icon,
        action: action ?? this.action,
        confirm: confirm ?? this.confirm,
        form: form ?? this.form,
      );

  factory Action.fromJson(Map<String, dynamic> json) => Action(
        label: json["label"],
        icon: json["icon"],
        action: json["action"],
        confirm: json["confirm"],
        form: json["form"],
      );

  Map<String, dynamic> toJson() => {
        "label": label,
        "icon": icon,
        "action": action,
        "confirm": confirm,
        "form": form,
      };
}

class Label {
  final int? id;
  final int? businessId;
  final String? groupType;
  final String? groupCode;
  final String? paramsOrgCode;
  final String? subType;
  final String? name;

  Label({
    this.id,
    this.businessId,
    this.groupType,
    this.groupCode,
    this.paramsOrgCode,
    this.subType,
    this.name,
  });

  Label copyWith({
    int? id,
    int? businessId,
    String? groupType,
    String? groupCode,
    String? paramsOrgCode,
    String? subType,
    String? name,
  }) =>
      Label(
        id: id ?? this.id,
        businessId: businessId ?? this.businessId,
        groupType: groupType ?? this.groupType,
        groupCode: groupCode ?? this.groupCode,
        paramsOrgCode: paramsOrgCode ?? this.paramsOrgCode,
        subType: subType ?? this.subType,
        name: name ?? this.name,
      );

  factory Label.fromJson(Map<String, dynamic> json) => Label(
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
