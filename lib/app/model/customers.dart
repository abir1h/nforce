class Customers {
  final int? page;
  final int? limit;
  final int? totalCount;
  final int? pageCount;
  final int? nextPage;
  final int? prevPage;
  final List<int>? pageChunks;
  final List<Customer>? data;
  final int? count;
  final List<Action>? actions;
  final List<Tool>? tools;

  Customers({
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

  Customers copyWith({
    int? page,
    int? limit,
    int? totalCount,
    int? pageCount,
    int? nextPage,
    int? prevPage,
    List<int>? pageChunks,
    List<Customer>? data,
    int? count,
    List<Action>? actions,
    List<Tool>? tools,
  }) =>
      Customers(
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

  factory Customers.fromJson(Map<String, dynamic> json) => Customers(
        page: json["page"],
        limit: json["limit"],
        totalCount: json["totalCount"],
        pageCount: json["pageCount"],
        nextPage: json["nextPage"],
        prevPage: json["prevPage"],
        pageChunks: json["pageChunks"] == null ? [] : List<int>.from(json["pageChunks"]!.map((x) => x)),
        data: json["data"] == null ? [] : List<Customer>.from(json["data"]!.map((x) => Customer.fromJson(x))),
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

  Action({
    this.label,
    this.icon,
  });

  Action copyWith({
    String? label,
    String? icon,
  }) =>
      Action(
        label: label ?? this.label,
        icon: icon ?? this.icon,
      );

  factory Action.fromJson(Map<String, dynamic> json) => Action(
        label: json["label"],
        icon: json["icon"],
      );

  Map<String, dynamic> toJson() => {
        "label": label,
        "icon": icon,
      };
}

class Customer {
  final int? id;
  final String? owner;
  final int? groupId;
  final dynamic belongsTo;
  final String? name;
  final String? companyTitle;
  final String? primaryEmail;
  final String? primaryMobile;

  Customer({
    this.id,
    this.owner,
    this.groupId,
    this.belongsTo,
    this.name,
    this.companyTitle,
    this.primaryEmail,
    this.primaryMobile,
  });

  Customer copyWith({
    int? id,
    String? owner,
    int? groupId,
    dynamic belongsTo,
    String? name,
    String? companyTitle,
    String? primaryEmail,
    String? primaryMobile,
  }) =>
      Customer(
        id: id ?? this.id,
        owner: owner ?? this.owner,
        groupId: groupId ?? this.groupId,
        belongsTo: belongsTo ?? this.belongsTo,
        name: name ?? this.name,
        companyTitle: companyTitle ?? this.companyTitle,
        primaryEmail: primaryEmail ?? this.primaryEmail,
        primaryMobile: primaryMobile ?? this.primaryMobile,
      );

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        id: json["id"],
        owner: json["owner"],
        groupId: json["groupId"],
        belongsTo: json["belongsTo"],
        name: json["name"],
        companyTitle: json["companyTitle"],
        primaryEmail: json["primaryEmail"],
        primaryMobile: json["primaryMobile"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "owner": owner,
        "groupId": groupId,
        "belongsTo": belongsTo,
        "name": name,
        "companyTitle": companyTitle,
        "primaryEmail": primaryEmail,
        "primaryMobile": primaryMobile,
      };
}

class Tool {
  final String? label;
  final String? icon;
  final String? toolClass;

  Tool({
    this.label,
    this.icon,
    this.toolClass,
  });

  Tool copyWith({
    String? label,
    String? icon,
    String? toolClass,
  }) =>
      Tool(
        label: label ?? this.label,
        icon: icon ?? this.icon,
        toolClass: toolClass ?? this.toolClass,
      );

  factory Tool.fromJson(Map<String, dynamic> json) => Tool(
        label: json["label"],
        icon: json["icon"],
        toolClass: json["class"],
      );

  Map<String, dynamic> toJson() => {
        "label": label,
        "icon": icon,
        "class": toolClass,
      };
}
