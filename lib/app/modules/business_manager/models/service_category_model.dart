import 'package:nuforce/app/modules/business_manager/models/form_model.dart';

class ServiceCategoryDataModel {
  final int page;
  final int limit;
  final int totalCount;
  final int pageCount;
  final int nextPage;
  final int prevPage;
  final List<int>? pageChunks;
  final List<ServiceCategoryModel>? data;
  final int count;
  final List<Columns>? columns;
  final List<Action>? actions;
  final List<Filter>? filters;
  final List<Tool>? tools;

  ServiceCategoryDataModel({
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
    required this.filters,
    required this.tools,
  });

  ServiceCategoryDataModel copyWith({
    int? page,
    int? limit,
    int? totalCount,
    int? pageCount,
    int? nextPage,
    int? prevPage,
    List<int>? pageChunks,
    List<ServiceCategoryModel>? data,
    int? count,
    List<Columns>? Columnss,
    List<Action>? actions,
    List<Filter>? filters,
    List<Tool>? tools,
  }) =>
      ServiceCategoryDataModel(
        page: page ?? this.page,
        limit: limit ?? this.limit,
        totalCount: totalCount ?? this.totalCount,
        pageCount: pageCount ?? this.pageCount,
        nextPage: nextPage ?? this.nextPage,
        prevPage: prevPage ?? this.prevPage,
        pageChunks: pageChunks ?? this.pageChunks,
        data: data ?? this.data,
        count: count ?? this.count,
        columns: Columnss ?? this.columns,
        actions: actions ?? this.actions,
        filters: filters ?? this.filters,
        tools: tools ?? this.tools,
      );

  factory ServiceCategoryDataModel.fromJson(Map<String, dynamic> json) => ServiceCategoryDataModel(
        page: json["page"],
        limit: json["limit"],
        totalCount: json["totalCount"],
        pageCount: json["pageCount"],
        nextPage: json["nextPage"],
        prevPage: json["prevPage"],
        pageChunks: json["pageChunks"] == null ? [] : List<int>.from(json["pageChunks"].map((x) => x)),
        data: json["data"] == null ? [] : List<ServiceCategoryModel>.from(json["data"].map((x) => ServiceCategoryModel.fromJson(x))),
        count: json["count"],
        columns: json["columns"] == null ? [] : List<Columns>.from(json["columns"].map((x) => Columns.fromJson(x))),
        actions: json["actions"] == null ? [] : List<Action>.from(json["actions"].map((x) => Action.fromJson(x))),
        filters: json["filters"] == null ? [] : List<Filter>.from(json["filters"].map((x) => Filter.fromJson(x))),
        tools: json["tools"] == null ? [] : List<Tool>.from(json["tools"].map((x) => Tool.fromJson(x))),
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
        "filters": List<dynamic>.from(filters!.map((x) => x.toJson())),
        "tools": List<dynamic>.from(tools!.map((x) => x.toJson())),
      };
}

class Action {
  final String action;
  final String label;
  final String icon;
  final String confirm;
  final String form;

  Action({
    required this.action,
    required this.label,
    required this.icon,
    required this.confirm,
    required this.form,
  });

  Action copyWith({
    String? action,
    String? label,
    String? icon,
    String? confirm,
    String? form,
  }) =>
      Action(
        action: action ?? this.action,
        label: label ?? this.label,
        icon: icon ?? this.icon,
        confirm: confirm ?? this.confirm,
        form: form ?? this.form,
      );

  factory Action.fromJson(Map<String, dynamic> json) => Action(
        action: json["action"] ?? "",
        label: json["label"] ?? "",
        icon: json["icon"] ?? "",
        confirm: json["confirm"] ?? "",
        form: json["form"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "action": action,
        "label": label,
        "icon": icon,
        "confirm": confirm,
        "form": form,
      };
}

class Columns {
  final String label;
  final String key;
  final bool hidden;
  final int order;
  final String name;
  final String description;

  Columns({
    required this.label,
    required this.key,
    required this.hidden,
    required this.order,
    required this.name,
    required this.description,
  });

  Columns copyWith({
    String? label,
    String? key,
    bool? hidden,
    int? order,
    String? name,
    String? description,
  }) =>
      Columns(
        label: label ?? this.label,
        key: key ?? this.key,
        hidden: hidden ?? this.hidden,
        order: order ?? this.order,
        name: name ?? this.name,
        description: description ?? this.description,
      );

  factory Columns.fromJson(Map<String, dynamic> json) => Columns(
        label: json["label"] ?? "",
        key: json["key"] ?? "",
        hidden: json["hidden"] ?? false,
        order: json["order"] ?? -1,
        name: json["name"] ?? "",
        description: json["description"] ?? "",
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

class ServiceCategoryModel {
  final int id;
  final int businessId;
  final String slug;
  final int parentId;
  final String refCode;
  final String breadcrumbs;
  final int childrenCount;

  ServiceCategoryModel({
    required this.id,
    required this.businessId,
    required this.slug,
    required this.parentId,
    required this.refCode,
    required this.breadcrumbs,
    required this.childrenCount,
  });

  ServiceCategoryModel copyWith({
    int? id,
    int? businessId,
    String? slug,
    int? parentId,
    String? refCode,
    String? breadcrumbs,
    int? childrenCount,
  }) =>
      ServiceCategoryModel(
        id: id ?? this.id,
        businessId: businessId ?? this.businessId,
        slug: slug ?? this.slug,
        parentId: parentId ?? this.parentId,
        refCode: refCode ?? this.refCode,
        breadcrumbs: breadcrumbs ?? this.breadcrumbs,
        childrenCount: childrenCount ?? this.childrenCount,
      );

  factory ServiceCategoryModel.fromJson(Map<String, dynamic> json) => ServiceCategoryModel(
        id: json["id"] ?? -1,
        businessId: json["businessId"] ?? -1,
        slug: json["slug"] ?? "",
        parentId: json["parentId"] ?? -1,
        refCode: json["refCode"] ?? "",
        breadcrumbs: json["breadcrumbs"] ?? "",
        childrenCount: json["childrenCount"] ?? -1,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "businessId": businessId,
        "slug": slug,
        "parentId": parentId,
        "refCode": refCode,
        "breadcrumbs": breadcrumbs,
        "childrenCount": childrenCount,
      };
}

class Filter {
  final String name;
  final String key;
  final String label;
  final int order;
  final bool readonly;
  final bool actions;
  final String editor;
  final List<dynamic>? validators;
  final Params? params;
  final String value;
  final List<Option> options;

  Filter({
    required this.name,
    required this.key,
    required this.label,
    required this.order,
    required this.readonly,
    required this.actions,
    required this.editor,
    required this.validators,
    required this.params,
    required this.value,
    required this.options,
  });

  Filter copyWith({
    String? name,
    String? key,
    String? label,
    int? order,
    bool? readonly,
    bool? actions,
    String? editor,
    List<dynamic>? validators,
    Params? params,
    dynamic value,
    List<Option>? options,
  }) =>
      Filter(
        name: name ?? this.name,
        key: key ?? this.key,
        label: label ?? this.label,
        order: order ?? this.order,
        readonly: readonly ?? this.readonly,
        actions: actions ?? this.actions,
        editor: editor ?? this.editor,
        validators: validators ?? this.validators,
        params: params ?? this.params,
        value: value ?? this.value,
        options: options ?? this.options,
      );

  factory Filter.fromJson(Map<String, dynamic> json) => Filter(
        name: json["name"] ?? "",
        key: json["key"] ?? "",
        label: json["label"] ?? "",
        order: json["order"] ?? -1,
        readonly: json["readonly"] ?? false,
        actions: json["actions"] ?? false,
        editor: json["editor"] ?? "",
        validators: json["validators"] == null ? [] : List<dynamic>.from(json["validators"].map((x) => x)),
        params: json["params"] == null ? null : Params.fromJson(json["params"]),
        value: json["value"] ?? "",
        options: json["options"] == null ? [] : List<Option>.from(json["options"].map((x) => Option.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "key": key,
        "label": label,
        "order": order,
        "readonly": readonly,
        "actions": actions,
        "editor": editor,
        "validators": List<dynamic>.from(validators!.map((x) => x)),
        "params": params!.toJson(),
        "value": value,
        "options": List<dynamic>.from(options.map((x) => x.toJson())),
      };
}

class Params {
  final String type;
  final String paramsClass;

  Params({
    required this.type,
    required this.paramsClass,
  });

  Params copyWith({
    String? type,
    String? paramsClass,
  }) =>
      Params(
        type: type ?? this.type,
        paramsClass: paramsClass ?? this.paramsClass,
      );

  factory Params.fromJson(Map<String, dynamic> json) => Params(
        type: json["type"] ?? "",
        paramsClass: json["class"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "class": paramsClass,
      };
}

class Tool {
  final String action;
  final String label;
  final String icon;

  Tool({
    required this.action,
    required this.label,
    required this.icon,
  });

  Tool copyWith({
    String? action,
    String? label,
    String? icon,
  }) =>
      Tool(
        action: action ?? this.action,
        label: label ?? this.label,
        icon: icon ?? this.icon,
      );

  factory Tool.fromJson(Map<String, dynamic> json) => Tool(
        action: json["action"] ?? "",
        label: json["label"] ?? "",
        icon: json["icon"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "action": action,
        "label": label,
        "icon": icon,
      };
}
