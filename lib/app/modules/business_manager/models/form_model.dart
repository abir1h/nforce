// ignore_for_file: constant_identifier_names

class FormModel {
  final List<Control>? controls;
  final List<Action>? actions;
  final List<dynamic>? data;
  final Map<String, dynamic>? query;

  FormModel({
    this.controls,
    this.actions,
    this.data,
    this.query,
  });

  FormModel copyWith({
    List<Control>? controls,
    List<Action>? actions,
    List<dynamic>? data,
    Map<String, dynamic>? query,
  }) =>
      FormModel(
        controls: controls ?? this.controls,
        actions: actions ?? this.actions,
        data: data ?? this.data,
        query: query ?? this.query,
      );

  factory FormModel.fromJson(Map<String, dynamic> json) => FormModel(
        controls: json['controls'] == null ? [] : List<Control>.from(json['controls']!.map((x) => Control.fromJson(x))),
        actions: json['actions'] == null ? [] : List<Action>.from(json['actions']!.map((x) => Action.fromJson(x))),
        data: json['data'] == null ? [] : List<Map<String, dynamic>>.from(json['data']!.map((x) => x)),
        query: json['query'] == null ? {} : Map<String, dynamic>.from(json['query']!),
      );

  Map<String, dynamic> toJson() => {
        'controls': controls == null ? [] : List<dynamic>.from(controls!.map((x) => x.toJson())),
        'actions': actions == null ? [] : List<dynamic>.from(actions!.map((x) => x.toJson())),
        'data': data == null ? [] : List<dynamic>.from(data!.map((x) => x)),
        'query': query == null ? [] : Map<String, dynamic>.from(query!)
      };
}

class Action {
  final String? action;
  final String? label;
  final String? color;
  final bool? confirm;
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
    bool? confirm,
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
        action: json['action'],
        label: json['label'],
        color: json['color'],
        confirm: json['confirm'],
        warning: json['warning'],
      );

  Map<String, dynamic> toJson() => {
        'action': action,
        'label': label,
        'color': color,
        'confirm': confirm,
        'warning': warning,
      };
}

class Control {
  final String? name;
  final String? key;
  final String? label;
  final int? order;
  final bool? readonly;
  final bool? actions;
  final Editor? editor;
  final List<dynamic>? validators;
  final Params? params;
  final String? value;
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
    Editor? editor,
    List<dynamic>? validators,
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
        name: json['name'],
        key: json['key'],
        label: json['label'],
        order: json['order'],
        readonly: json['readonly'],
        actions: json['actions'],
        editor: editorValues.map[json['editor']]!,
        validators: json['validators'] == null ? [] : List<dynamic>.from(json['validators']!.map((x) => x)),
        params: json['params'] == null ? null : Params.fromJson(json['params']),
        value: json['value'],
        options: json['options'] == null ? [] : List<Option>.from(json['options']!.map((x) => Option.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'key': key,
        'label': label,
        'order': order,
        'readonly': readonly,
        'actions': actions,
        'editor': editorValues.reverse[editor],
        'validators': validators == null ? [] : List<dynamic>.from(validators!.map((x) => x)),
        'params': params?.toJson(),
        'value': value,
        'options': options == null ? [] : List<dynamic>.from(options!.map((x) => x.toJson())),
      };
}

enum Editor { DROPDOWN, FILEINPUT, TEXT, SWTICH }

final editorValues = EnumValues({'dropdown': Editor.DROPDOWN, 'fileinput': Editor.FILEINPUT, 'text': Editor.TEXT, 'swtich': Editor.SWTICH});

class Option {
  final String? label;
  final String? value;

  Option({
    this.label,
    this.value,
  });

  Option copyWith({
    String? label,
    String? value,
  }) =>
      Option(
        label: label ?? this.label,
        value: value ?? this.value,
      );

  factory Option.fromJson(Map<String, dynamic> json) => Option(
        label: json['label'],
        value: json['value'],
      );

  Map<String, dynamic> toJson() => {
        'label': label,
        'value': value,
      };
}

class Params {
  final Type? type;
  final String? leftIcon;
  final String? paramsClass;
  final int? public;
  final dynamic csrf;
  final dynamic thumbUrl;

  Params({
    this.type,
    this.leftIcon,
    this.paramsClass,
    this.public,
    this.csrf,
    this.thumbUrl,
  });

  Params copyWith({
    Type? type,
    String? leftIcon,
    String? paramsClass,
    int? public,
    dynamic csrf,
    dynamic thumbUrl,
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
        type: typeValues.map[json['type']]!,
        leftIcon: json['leftIcon'],
        paramsClass: json['class'],
        public: json['public'],
        csrf: json['csrf'],
        thumbUrl: json['thumbUrl'],
      );

  Map<String, dynamic> toJson() => {
        'type': typeValues.reverse[type],
        'leftIcon': leftIcon,
        'class': paramsClass,
        'public': public,
        'csrf': csrf,
        'thumbUrl': thumbUrl,
      };
}

enum Type { TEXT, TEXTAREA }

final typeValues = EnumValues({'text': Type.TEXT, 'textarea': Type.TEXTAREA});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
