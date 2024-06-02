// To parse this JSON data, do
//
//     final serviceTopicDataModel = serviceTopicDataModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ServiceTopicDataModel serviceTopicDataModelFromJson(String str) =>
    ServiceTopicDataModel.fromJson(json.decode(str));

String serviceTopicDataModelToJson(ServiceTopicDataModel data) =>
    json.encode(data.toJson());

class ServiceTopicDataModel {
  final int page;
  final int limit;
  final int totalCount;
  final int pageCount;
  final int nextPage;
  final int prevPage;
  final List<int>? pageChunks;
  final List<ServiceTopicModel>? data;
  final int count;
  final List<Colums>? colums;
  final List<Action>? actions;
  final List<Action>? tools;

  ServiceTopicDataModel({
    required this.page,
    required this.limit,
    required this.totalCount,
    required this.pageCount,
    required this.nextPage,
    required this.prevPage,
    required this.pageChunks,
    required this.data,
    required this.count,
    required this.colums,
    required this.actions,
    required this.tools,
  });

  ServiceTopicDataModel copyWith({
    int? page,
    int? limit,
    int? totalCount,
    int? pageCount,
    int? nextPage,
    int? prevPage,
    List<int>? pageChunks,
    List<ServiceTopicModel>? data,
    int? count,
    List<Colums>? colums,
    List<Action>? actions,
    List<Action>? tools,
  }) =>
      ServiceTopicDataModel(
        page: page ?? this.page,
        limit: limit ?? this.limit,
        totalCount: totalCount ?? this.totalCount,
        pageCount: pageCount ?? this.pageCount,
        nextPage: nextPage ?? this.nextPage,
        prevPage: prevPage ?? this.prevPage,
        pageChunks: pageChunks ?? this.pageChunks,
        data: data ?? this.data,
        count: count ?? this.count,
        colums: colums ?? this.colums,
        actions: actions ?? this.actions,
        tools: tools ?? this.tools,
      );

  factory ServiceTopicDataModel.fromJson(Map<String, dynamic> json) =>
      ServiceTopicDataModel(
        page: json["page"],
        limit: json["limit"],
        totalCount: json["totalCount"],
        pageCount: json["pageCount"],
        nextPage: json["nextPage"],
        prevPage: json["prevPage"],
        pageChunks: json["pageChunks"] == null
            ? []
            : List<int>.from(json["pageChunks"].map((x) => x)),
        data: json["data"] == null
            ? []
            : List<ServiceTopicModel>.from(json["data"].map((x) => ServiceTopicModel.fromJson(x))),
        count: json["count"],
        colums: json["columns"] == null
            ? []
            : List<Colums>.from(json["columns"].map((x) => Colums.fromJson(x))),
        actions: json["actions"] == null
            ? []
            : List<Action>.from(json["actions"].map((x) => Action.fromJson(x))),
        tools: json["tools"] == null
            ? []
            : List<Action>.from(json["tools"].map((x) => Action.fromJson(x))),
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
        "colums": List<dynamic>.from(colums!.map((x) => x.toJson())),
        "actions": List<dynamic>.from(actions!.map((x) => x.toJson())),
        "tools": List<dynamic>.from(tools!.map((x) => x.toJson())),
      };
}

class Action {
  final String label;
  final String icon;
  final String action;
  final Data? data;

  Action({
    required this.label,
    required this.icon,
    required this.action,
    required this.data,
  });

  Action copyWith({
    String? label,
    String? icon,
    String? action,
    Data? data,
  }) =>
      Action(
        label: label ?? this.label,
        icon: icon ?? this.icon,
        action: action ?? this.action,
        data: data ?? this.data,
      );

  factory Action.fromJson(Map<String, dynamic> json) => Action(
        label: json["label"],
        icon: json["icon"],
        action: json["action"],
        data: json["data"]!=null?Data.fromJson(json["data"]):null,
      );

  Map<String, dynamic> toJson() => {
        "label": label,
        "icon": icon,
        "action": action,
        "data": data!.toJson(),
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

class Colums {
  final String key;
  final bool hidden;
  final String label;
  final int order;
  final String name;
  final String description;

  Colums({
    required this.key,
    required this.hidden,
    required this.label,
    required this.order,
    required this.name,
    required this.description,
  });

  Colums copyWith({
    String? key,
    bool? hidden,
    String? label,
    int? order,
    String? name,
    String? description,
  }) =>
      Colums(
        key: key ?? this.key,
        hidden: hidden ?? this.hidden,
        label: label ?? this.label,
        order: order ?? this.order,
        name: name ?? this.name,
        description: description ?? this.description,
      );

  factory Colums.fromJson(Map<String, dynamic> json) => Colums(
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

class ServiceTopicModel {
  final int id;
  final int businessId;
  final String groupType;
  final String groupCode;
  final String name;

  ServiceTopicModel({
    required this.id,
    required this.businessId,
    required this.groupType,
    required this.groupCode,
    required this.name,
  });

  ServiceTopicModel copyWith({
    int? id,
    int? businessId,
    String? groupType,
    String? groupCode,
    String? name,
  }) =>
      ServiceTopicModel(
        id: id ?? this.id,
        businessId: businessId ?? this.businessId,
        groupType: groupType ?? this.groupType,
        groupCode: groupCode ?? this.groupCode,
        name: name ?? this.name,
      );

  factory ServiceTopicModel.fromJson(Map<String, dynamic> json) => ServiceTopicModel(
        id: json["id"],
        businessId: json["businessId"],
        groupType: json["groupType"],
        groupCode: json["groupCode"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "businessId": businessId,
        "groupType": groupType,
        "groupCode": groupCode,
        "name": name,
      };
}
