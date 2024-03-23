import 'package:nuforce/app/modules/line_item/models/control.dart';

class FormModel {
  final List<Control>? controls;
  final List<Action>? actions;
  final List<dynamic>? data;
  final List<dynamic>? tools;

  FormModel({
    this.controls,
    this.actions,
    this.data,
    this.tools,
  });

  FormModel copyWith({
    List<Control>? controls,
    List<Action>? actions,
    List<dynamic>? data,
    List<dynamic>? tools,
  }) =>
      FormModel(
        controls: controls ?? this.controls,
        actions: actions ?? this.actions,
        data: data ?? this.data,
        tools: tools ?? this.tools,
      );

  factory FormModel.fromJson(Map<String, dynamic> json) => FormModel(
        controls: json["controls"] == null ? [] : List<Control>.from(json["controls"]!.map((x) => Control.fromJson(x))),
        actions: json["actions"] == null ? [] : List<Action>.from(json["actions"]!.map((x) => Action.fromJson(x))),
        data: json["data"] == null ? [] : List<dynamic>.from(json["data"]!.map((x) => x)),
        tools: json["tools"] == null ? [] : List<dynamic>.from(json["tools"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "controls": controls == null ? [] : List<dynamic>.from(controls!.map((x) => x.toJson())),
        "actions": actions == null ? [] : List<dynamic>.from(actions!.map((x) => x.toJson())),
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x)),
        "tools": tools == null ? [] : List<dynamic>.from(tools!.map((x) => x)),
      };
}

class Action {
  final String? action;
  final String? label;
  final String? color;
  final String? confirm;
  final String? warning;

  Action({
    this.action,
    this.label,
    this.color,
    this.confirm,
    this.warning,
  });

  Action copyWith({
    String? action,
    String? label,
    String? color,
    String? confirm,
    String? warning,
  }) =>
      Action(
        action: action ?? this.action,
        label: label ?? this.label,
        color: color ?? this.color,
        confirm: confirm ?? this.confirm,
        warning: warning ?? this.warning,
      );

  factory Action.fromJson(Map<String, dynamic> json) => Action(
        action: json["action"],
        label: json["label"],
        color: json["color"],
        confirm: json["confirm"],
        warning: json["warning"],
      );

  Map<String, dynamic> toJson() => {
        "action": action,
        "label": label,
        "color": color,
        "confirm": confirm,
        "warning": warning,
      };
}

class Option {
  final String? label;
  final dynamic value;

  Option({
    this.label,
    this.value,
  });

  Option copyWith({
    String? label,
    dynamic value,
  }) =>
      Option(
        label: label ?? this.label,
        value: value ?? this.value,
      );

  factory Option.fromJson(Map<String, dynamic> json) => Option(
        label: json["label"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "label": label,
        "value": value,
      };
}

class Params {
  final String? type;
  final String? leftIcon;
  final String? paramsClass;
  final int? public;
  final dynamic csrf;
  final String? thumbUrl;

  Params({
    this.type,
    this.leftIcon,
    this.paramsClass,
    this.public,
    this.csrf,
    this.thumbUrl,
  });

  Params copyWith({
    String? type,
    String? leftIcon,
    String? paramsClass,
    int? public,
    dynamic csrf,
    String? thumbUrl,
  }) =>
      Params(
        type: type ?? this.type,
        leftIcon: leftIcon ?? this.leftIcon,
        paramsClass: paramsClass ?? this.paramsClass,
        public: public ?? this.public,
        csrf: csrf ?? this.csrf,
        thumbUrl: thumbUrl ?? this.thumbUrl,
      );

  factory Params.fromJson(Map<String, dynamic> json) => Params(
        type: json["type"],
        leftIcon: json["leftIcon"],
        paramsClass: json["class"],
        public: json["public"],
        csrf: json["csrf"],
        thumbUrl: json["thumbUrl"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "leftIcon": leftIcon,
        "class": paramsClass,
        "public": public,
        "csrf": csrf,
        "thumbUrl": thumbUrl,
      };
}
