class CalendarList {
  final int? page;
  final int? limit;
  final int? totalCount;
  final int? pageCount;
  final int? nextPage;
  final int? prevPage;
  final List<int>? pageChunks;
  final List<CalendarData>? data;
  final int? count;
  final List<Action>? actions;
  final List<Action>? tools;

  CalendarList({
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

  CalendarList copyWith({
    int? page,
    int? limit,
    int? totalCount,
    int? pageCount,
    int? nextPage,
    int? prevPage,
    List<int>? pageChunks,
    List<CalendarData>? data,
    int? count,
    List<Action>? actions,
    List<Action>? tools,
  }) =>
      CalendarList(
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

  factory CalendarList.fromJson(Map<String, dynamic> json) => CalendarList(
        page: json["page"],
        limit: json["limit"],
        totalCount: json["totalCount"],
        pageCount: json["pageCount"],
        nextPage: json["nextPage"],
        prevPage: json["prevPage"],
        pageChunks: json["pageChunks"] == null ? [] : List<int>.from(json["pageChunks"]!.map((x) => x)),
        data: json["data"] == null ? [] : List<CalendarData>.from(json["data"]!.map((x) => CalendarData.fromJson(x))),
        count: json["count"],
        actions: json["actions"] == null ? [] : List<Action>.from(json["actions"]!.map((x) => Action.fromJson(x))),
        tools: json["tools"] == null ? [] : List<Action>.from(json["tools"]!.map((x) => Action.fromJson(x))),
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
  final String? action;
  final String? label;
  final String? icon;

  Action({
    this.action,
    this.label,
    this.icon,
  });

  Action copyWith({
    String? action,
    String? label,
    String? icon,
  }) =>
      Action(
        action: action ?? this.action,
        label: label ?? this.label,
        icon: icon ?? this.icon,
      );

  factory Action.fromJson(Map<String, dynamic> json) => Action(
        action: json["action"],
        label: json["label"],
        icon: json["icon"],
      );

  Map<String, dynamic> toJson() => {
        "action": action,
        "label": label,
        "icon": icon,
      };
}

class CalendarData {
  final int? id;
  final int? businessId;
  final String? name;
  final String? timezone;

  CalendarData({
    this.id,
    this.businessId,
    this.name,
    this.timezone,
  });

  CalendarData copyWith({
    int? id,
    int? businessId,
    String? name,
    String? timezone,
  }) =>
      CalendarData(
        id: id ?? this.id,
        businessId: businessId ?? this.businessId,
        name: name ?? this.name,
        timezone: timezone ?? this.timezone,
      );

  factory CalendarData.fromJson(Map<String, dynamic> json) => CalendarData(
        id: json["id"],
        businessId: json["businessId"],
        name: json["name"],
        timezone: json["timezone"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "businessId": businessId,
        "name": name,
        "timezone": timezone,
      };
}
