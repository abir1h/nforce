class LineItemControllerModel {
  final List<Control>? controls;
  final List<Action>? actions;
  // final List<dynamic>? data;
  // final List<dynamic>? query;
  // final List<dynamic>? tools;

  LineItemControllerModel({
    this.controls,
    this.actions,
    // this.data,
    // this.query,
    // this.tools,
  });

  LineItemControllerModel copyWith({
    List<Control>? controls,
    List<Action>? actions,
    // List<dynamic>? data,
    // List<dynamic>? query,
    // List<dynamic>? tools,
  }) =>
      LineItemControllerModel(
        controls: controls ?? this.controls,
        actions: actions ?? this.actions,
        // data: data ?? this.data,
        // query: query ?? this.query,
        // tools: tools ?? this.tools,
      );

  factory LineItemControllerModel.fromJson(Map<String, dynamic> json) => LineItemControllerModel(
        controls: json["controls"] == null ? [] : List<Control>.from(json["controls"]!.map((x) => Control.fromJson(x))),
        actions: json["actions"] == null ? [] : List<Action>.from(json["actions"]!.map((x) => Action.fromJson(x))),
        // data: json["data"] == null ? [] : List<dynamic>.from(json["data"]!.map((x) => x)),
        // query: json["query"] == null ? [] : List<dynamic>.from(json["query"]!.map((x) => x)),
        // tools: json["tools"] == null ? [] : List<dynamic>.from(json["tools"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "controls": controls == null ? [] : List<dynamic>.from(controls!.map((x) => x.toJson())),
        "actions": actions == null ? [] : List<dynamic>.from(actions!.map((x) => x.toJson())),
        // "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x)),
        // "query": query == null ? [] : List<dynamic>.from(query!.map((x) => x)),
        // "tools": tools == null ? [] : List<dynamic>.from(tools!.map((x) => x)),
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

class Control {
  final String? name;
  final String? key;
  final String? label;
  final int? order;
  final bool? readonly;
  final bool? actions;
  final String? editor;
  final dynamic validators;
  final Params? params;
  final dynamic value;
  final List<Option>? options;

  Control({
    this.name,
    this.key,
    this.label,
    this.order,
    this.readonly,
    this.actions,
    this.editor,
    this.validators,
    this.params,
    this.value,
    this.options,
  });

  Control copyWith({
    String? name,
    String? key,
    String? label,
    int? order,
    bool? readonly,
    bool? actions,
    String? editor,
    dynamic validators,
    Params? params,
    dynamic value,
    List<Option>? options,
  }) =>
      Control(
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

  factory Control.fromJson(Map<String, dynamic> json) => Control(
        name: json["name"],
        key: json["key"],
        label: json["label"],
        order: json["order"],
        readonly: json["readonly"],
        actions: json["actions"],
        editor: json["editor"],
        validators: json["validators"],
        params: json["params"] == null ? null : Params.fromJson(json["params"]),
        value: json["value"],
        options: json["options"] == null ? [] : List<Option>.from(json["options"]!.map((x) => Option.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "key": key,
        "label": label,
        "order": order,
        "readonly": readonly,
        "actions": actions,
        "editor": editor,
        "validators": validators,
        "params": params?.toJson(),
        "value": value,
        "options": options == null ? [] : List<dynamic>.from(options!.map((x) => x.toJson())),
      };
}

class Option {
  final String? label;
  final int? value;

  Option({
    this.label,
    this.value,
  });

  Option copyWith({
    String? label,
    int? value,
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
  final String? paramsClass;
  final String? help;

  Params({
    this.type,
    this.paramsClass,
    this.help,
  });

  Params copyWith({
    String? type,
    String? paramsClass,
    String? help,
  }) =>
      Params(
        type: type ?? this.type,
        paramsClass: paramsClass ?? this.paramsClass,
        help: help ?? this.help,
      );

  factory Params.fromJson(Map<String, dynamic> json) => Params(
        type: json["type"]!,
        paramsClass: json["class"],
        help: json["help"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "class": paramsClass,
        "help": help,
      };
}
