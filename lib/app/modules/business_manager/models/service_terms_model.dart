// To parse this JSON data, do
//
//     final serviceTermsDataModel = serviceTermsDataModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ServiceTermsDataModel serviceTermsDataModelFromJson(String str) => ServiceTermsDataModel.fromJson(json.decode(str));

String serviceTermsDataModelToJson(ServiceTermsDataModel data) => json.encode(data.toJson());

class ServiceTermsDataModel {
  final int page;
  final int limit;
  final int totalCount;
  final int pageCount;
  final int nextPage;
  final int prevPage;
  final List<int>? pageChunks;
  final List<ServiceTermsModel>? data;
  final int count;
  final List<Columns>? columns;

  ServiceTermsDataModel({
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

  ServiceTermsDataModel copyWith({
    int? page,
    int? limit,
    int? totalCount,
    int? pageCount,
    int? nextPage,
    int? prevPage,
    List<int>? pageChunks,
    List<ServiceTermsModel>? data,
    int? count,
    List<Columns>? columns,
  }) =>
      ServiceTermsDataModel(
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

  factory ServiceTermsDataModel.fromJson(Map<String, dynamic> json) => ServiceTermsDataModel(
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
        : List<ServiceTermsModel>.from(json["data"].map((x) => ServiceTermsModel.fromJson(x))),
    count: json["count"],
    columns:  json["columns"] == null
        ? []
        :List<Columns>.from(json["columns"].map((x) => Columns.fromJson(x))),
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

class Columns {
  final String? key;
  final bool? hidden;
  final String? label;
  final int? order;
  final String? name;
  final String? description;

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
    key: json["key"]??"",
    hidden: json["hidden"]??false,
    label: json["label"]??"",
    order: json["order"]??-1,
    name: json["name"]??"",
    description: json["description"]??"",
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

class ServiceTermsModel {
  final int id;
  final int businessId;
  final String name;
  final String policyType;
  final String active;

  ServiceTermsModel({
    required this.id,
    required this.businessId,
    required this.name,
    required this.policyType,
    required this.active,
  });

  ServiceTermsModel copyWith({
    int? id,
    int? businessId,
    String? name,
    String? policyType,
    String? active,
  }) =>
      ServiceTermsModel(
        id: id ?? this.id,
        businessId: businessId ?? this.businessId,
        name: name ?? this.name,
        policyType: policyType ?? this.policyType,
        active: active ?? this.active,
      );

  factory ServiceTermsModel.fromJson(Map<String, dynamic> json) => ServiceTermsModel(
    id: json["id"],
    businessId: json["businessId"],
    name: json["name"],
    policyType: json["policyType"],
    active: json["active"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "businessId": businessId,
    "name": name,
    "policyType": policyType,
    "active": active,
  };
}
