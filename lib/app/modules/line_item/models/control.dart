class Control {
  final String? name;
  final String? key;
  final String? label;
  final int? order;
  final bool? readonly;
  final bool? actions;
  final String? editor;
  final List<dynamic>? validators;
  final Params? params;
  final dynamic value;

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
  });

  Control copyWith({
    String? name,
    String? key,
    String? label,
    int? order,
    bool? readonly,
    bool? actions,
    String? editor,
    List<dynamic>? validators,
    Params? params,
    int? value,
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
      );

  factory Control.fromJson(Map<String, dynamic> json) => Control(
        name: json["name"],
        key: json["key"],
        label: json["label"],
        order: json["order"],
        readonly: json["readonly"],
        actions: json["actions"],
        editor: json["editor"],
        validators: json["validators"] == null ? [] : List<dynamic>.from(json["validators"]!.map((x) => x)),
        params: json["params"] == null ? null : Params.fromJson(json["params"]),
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "key": key,
        "label": label,
        "order": order,
        "readonly": readonly,
        "actions": actions,
        "editor": editor,
        "validators": validators == null ? [] : List<dynamic>.from(validators!.map((x) => x)),
        "params": params?.toJson(),
        "value": value,
      };
}

class Params {
  final String? type;
  final String? paramsClass;
  final String? help;
  final String? queryUrl;

  Params({
    this.type,
    this.paramsClass,
    this.help,
    this.queryUrl,
  });

  Params copyWith({
    String? type,
    String? paramsClass,
    String? help,
    String? queryUrl,
  }) =>
      Params(
        type: type ?? this.type,
        paramsClass: paramsClass ?? this.paramsClass,
        help: help ?? this.help,
        queryUrl: queryUrl ?? this.queryUrl,
      );

  factory Params.fromJson(Map<String, dynamic> json) => Params(
        type: json["type"],
        paramsClass: json["class"],
        help: json["help"],
        queryUrl: json["queryUrl"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "class": paramsClass,
        "help": help,
        "queryUrl": queryUrl,
      };
}
