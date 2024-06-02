// To parse this JSON data, do
//
//     final serviceRegionDataModel = serviceRegionDataModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ServiceRegionDataModel serviceRegionDataModelFromJson(String str) => ServiceRegionDataModel.fromJson(json.decode(str));

String serviceRegionDataModelToJson(ServiceRegionDataModel data) => json.encode(data.toJson());

class ServiceRegionDataModel {
  final int page;
  final int limit;
  final int totalCount;
  final int pageCount;
  final int nextPage;
  final int prevPage;
  final List<int>? pageChunks;
  final List<ServiceRegionModel>? data;
  final int count;
  final List<Columns>? columns;
  final List<Action>? actions;
  final List<Tool>? tools;

  ServiceRegionDataModel({
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
    required this.actions,
    required this.tools,
  });

  ServiceRegionDataModel copyWith({
    int? page,
    int? limit,
    int? totalCount,
    int? pageCount,
    int? nextPage,
    int? prevPage,
    List<int>? pageChunks,
    List<ServiceRegionModel>? data,
    int? count,
    List<Columns>? columns,
    List<Action>? actions,
    List<Tool>? tools,
  }) =>
      ServiceRegionDataModel(
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

  factory ServiceRegionDataModel.fromJson(Map<String, dynamic> json) => ServiceRegionDataModel(
    page: json["page"],
    limit: json["limit"],
    totalCount: json["totalCount"],
    pageCount: json["pageCount"],
    nextPage: json["nextPage"],
    prevPage: json["prevPage"],
    pageChunks: json["pageChunks"] == null
        ? []
        :List<int>.from(json["pageChunks"].map((x) => x)),
    data:json["data"] == null
        ? []
        : List<ServiceRegionModel>.from(json["data"].map((x) => ServiceRegionModel.fromJson(x))),
    count: json["count"],
    columns: json["columns"] == null
        ? []
        :List<Columns>.from(json["columns"].map((x) => Columns.fromJson(x))),
    actions:json["actions"] == null
        ? []
        : List<Action>.from(json["actions"].map((x) => Action.fromJson(x))),
    tools: json["tools"] == null
        ? []
        :List<Tool>.from(json["tools"].map((x) => Tool.fromJson(x))),
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
    "actions": List<dynamic>.from(actions!.map((x) => x.toJson())),
    "tools": List<dynamic>.from(tools!.map((x) => x.toJson())),
  };
}

class Action {
  final String? label;
  final String? icon;
  final String? action;
  final String? form;
  final String? confirm;

  Action({
    required this.label,
    required this.icon,
    required this.action,
    required this.form,
    required this.confirm,
  });

  Action copyWith({
    String? label,
    String? icon,
    String? action,
    String? form,
    String? confirm,
  }) =>
      Action(
        label: label ?? this.label,
        icon: icon ?? this.icon,
        action: action ?? this.action,
        form: form ?? this.form,
        confirm: confirm ?? this.confirm,
      );

  factory Action.fromJson(Map<String, dynamic> json) => Action(
    label: json["label"]??"",
    icon: json["icon"]??"",
    action: json["action"]??"",
    form: json["form"]??"",
    confirm: json["confirm"]??"",
  );

  Map<String, dynamic> toJson() => {
    "label": label,
    "icon": icon,
    "action": action,
    "form": form,
    "confirm": confirm,
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

class ServiceRegionModel {
  final int id;
  final int businessId;
  final String groupType;
  final String groupCode;
  final String paramsOrgCode;
  final String name;
  final String subType;

  ServiceRegionModel({
    required this.id,
    required this.businessId,
    required this.groupType,
    required this.groupCode,
    required this.paramsOrgCode,
    required this.name,
    required this.subType,
  });

  ServiceRegionModel copyWith({
    int? id,
    int? businessId,
    String? groupType,
    String? groupCode,
    String? paramsOrgCode,
    String? name,
    String? subType,
  }) =>
      ServiceRegionModel(
        id: id ?? this.id,
        businessId: businessId ?? this.businessId,
        groupType: groupType ?? this.groupType,
        groupCode: groupCode ?? this.groupCode,
        paramsOrgCode: paramsOrgCode ?? this.paramsOrgCode,
        name: name ?? this.name,
        subType: subType ?? this.subType,
      );

  factory ServiceRegionModel.fromJson(Map<String, dynamic> json) => ServiceRegionModel(
    id: json["id"]??-1,
    businessId: json["businessId"]??-1,
    groupType: json["groupType"]??"",
    groupCode: json["groupCode"]??"",
    paramsOrgCode: json["paramsOrgCode"]??"",
    name: json["name"]??"",
    subType: json["subType"]??"",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "businessId": businessId,
    "groupType": groupType,
    "groupCode": groupCode,
    "paramsOrgCode": paramsOrgCode,
    "name": name,
    "subType": subType,
  };
}

class Tool {
  final String label;
  final String icon;
  final String action;
  final Data data;

  Tool({
    required this.label,
    required this.icon,
    required this.action,
    required this.data,
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
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "label": label,
    "icon": icon,
    "action": action,
    "data": data.toJson(),
  };
}

class Data {
  final String groupType;

  Data({
    required this.groupType,
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
