import 'package:nuforce/app/modules/line_item/models/control.dart';

class LineItemControllerModel {
  final List<Control>? controls;
  final List<Action>? actions;
  final Data? data;
  final List<dynamic>? query;
  final List<dynamic>? tools;

  LineItemControllerModel({
    this.controls,
    this.actions,
    this.data,
    this.query,
    this.tools,
  });

  LineItemControllerModel copyWith({
    List<Control>? controls,
    List<Action>? actions,
    Data? data,
    List<dynamic>? query,
    List<dynamic>? tools,
  }) =>
      LineItemControllerModel(
        controls: controls ?? this.controls,
        actions: actions ?? this.actions,
        data: data ?? this.data,
        query: query ?? this.query,
        tools: tools ?? this.tools,
      );

  factory LineItemControllerModel.fromJson(Map<String, dynamic> json) => LineItemControllerModel(
        controls: json["controls"] == null ? [] : List<Control>.from(json["controls"]!.map((x) => Control.fromJson(x))),
        // actions: json["actions"] == null ? [] : List<Action>.from(json["actions"]!.map((x) => Action.fromJson(x))),
        // data: json["data"] == null ? null : Data.fromJson(json["data"]),
        // query: json["query"] == null ? [] : List<dynamic>.from(json["query"]!.map((x) => x)),
        // tools: json["tools"] == null ? [] : List<dynamic>.from(json["tools"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "controls": controls == null ? [] : List<dynamic>.from(controls!.map((x) => x.toJson())),
        "actions": actions == null ? [] : List<dynamic>.from(actions!.map((x) => x.toJson())),
        "data": data?.toJson(),
        "query": query == null ? [] : List<dynamic>.from(query!.map((x) => x)),
        "tools": tools == null ? [] : List<dynamic>.from(tools!.map((x) => x)),
      };
}

class Action {
  final String? action;
  final String? label;

  Action({
    this.action,
    this.label,
  });

  Action copyWith({
    String? action,
    String? label,
  }) =>
      Action(
        action: action ?? this.action,
        label: label ?? this.label,
      );

  factory Action.fromJson(Map<String, dynamic> json) => Action(
        action: json["action"],
        label: json["label"],
      );

  Map<String, dynamic> toJson() => {
        "action": action,
        "label": label,
      };
}

class Data {
  final int? workorderId;
  final int? invoiceId;

  Data({
    this.workorderId,
    this.invoiceId,
  });

  Data copyWith({
    int? workorderId,
    int? invoiceId,
  }) =>
      Data(
        workorderId: workorderId ?? this.workorderId,
        invoiceId: invoiceId ?? this.invoiceId,
      );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        workorderId: json["workorder_id"],
        invoiceId: json["invoice_id"],
      );

  Map<String, dynamic> toJson() => {
        "workorder_id": workorderId,
        "invoice_id": invoiceId,
      };
}
