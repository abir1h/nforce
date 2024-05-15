class CompanyPaymentOptions {
  final Data? data;

  CompanyPaymentOptions({
    this.data,
  });

  CompanyPaymentOptions copyWith({
    Data? data,
  }) =>
      CompanyPaymentOptions(
        data: data ?? this.data,
      );

  factory CompanyPaymentOptions.fromJson(Map<String, dynamic> json) => CompanyPaymentOptions(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
      };
}

class Data {
  final PaymentOption? cash;
  final PaymentOption? check;
  final PaymentOption? stripe;

  Data({
    this.cash,
    this.check,
    this.stripe,
  });

  Data copyWith({
    PaymentOption? cash,
    PaymentOption? check,
    PaymentOption? stripe,
  }) =>
      Data(
        cash: cash ?? this.cash,
        check: check ?? this.check,
        stripe: stripe ?? this.stripe,
      );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        cash: json["cash"] == null ? null : PaymentOption.fromJson(json["cash"]),
        check: json["check"] == null ? null : PaymentOption.fromJson(json["check"]),
        stripe: json["stripe"] == null ? null : PaymentOption.fromJson(json["stripe"]),
      );

  Map<String, dynamic> toJson() => {
        "cash": cash?.toJson(),
        "check": check?.toJson(),
        "stripe": stripe?.toJson(),
      };
}

class PaymentOption {
  final int? id;
  final int? businessId;
  final String? methodType;
  final String? name;
  final String? accountId;
  final int? live;
  final String? liveToken;
  final Connect? connect;
  final Details? details;
  final Params? params;
  final String? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  PaymentOption({
    this.id,
    this.businessId,
    this.methodType,
    this.name,
    this.accountId,
    this.live,
    this.liveToken,
    this.connect,
    this.details,
    this.params,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  PaymentOption copyWith({
    int? id,
    int? businessId,
    String? methodType,
    String? name,
    String? accountId,
    int? live,
    String? liveToken,
    Connect? connect,
    Details? details,
    Params? params,
    String? status,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      PaymentOption(
        id: id ?? this.id,
        businessId: businessId ?? this.businessId,
        methodType: methodType ?? this.methodType,
        name: name ?? this.name,
        accountId: accountId ?? this.accountId,
        live: live ?? this.live,
        liveToken: liveToken ?? this.liveToken,
        connect: connect ?? this.connect,
        details: details ?? this.details,
        params: params ?? this.params,
        status: status ?? this.status,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory PaymentOption.fromJson(Map<String, dynamic> json) => PaymentOption(
        id: json["id"],
        businessId: json["business_id"],
        methodType: json["method_type"],
        name: json["name"],
        accountId: json["account_id"],
        live: json["live"],
        liveToken: json["live_token"],
        connect: json["connect"] == null ? null : Connect.fromJson(json["connect"]),
        details: json["details"] == null ? null : Details.fromJson(json["details"]),
        params: json["params"] == null ? null : Params.fromJson(json["params"]),
        status: json["status"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "business_id": businessId,
        "method_type": methodType,
        "name": name,
        "account_id": accountId,
        "live": live,
        "live_token": liveToken,
        "connect": connect?.toJson(),
        "details": details?.toJson(),
        "params": params?.toJson(),
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

class Connect {
  final String? scope;
  final DateTime? issuedAt;
  final String? tokenType;
  final String? stripePublishableKey;
  final bool? livemode;
  final String? stripeUserId;
  final String? refreshToken;
  final String? accessToken;

  Connect({
    this.scope,
    this.issuedAt,
    this.tokenType,
    this.stripePublishableKey,
    this.livemode,
    this.stripeUserId,
    this.refreshToken,
    this.accessToken,
  });

  Connect copyWith({
    String? scope,
    DateTime? issuedAt,
    String? tokenType,
    String? stripePublishableKey,
    bool? livemode,
    String? stripeUserId,
    String? refreshToken,
    String? accessToken,
  }) =>
      Connect(
        scope: scope ?? this.scope,
        issuedAt: issuedAt ?? this.issuedAt,
        tokenType: tokenType ?? this.tokenType,
        stripePublishableKey: stripePublishableKey ?? this.stripePublishableKey,
        livemode: livemode ?? this.livemode,
        stripeUserId: stripeUserId ?? this.stripeUserId,
        refreshToken: refreshToken ?? this.refreshToken,
        accessToken: accessToken ?? this.accessToken,
      );

  factory Connect.fromJson(Map<String, dynamic> json) => Connect(
        scope: json["scope"],
        issuedAt: json["issued_at"] == null ? null : DateTime.parse(json["issued_at"]),
        tokenType: json["token_type"],
        stripePublishableKey: json["stripe_publishable_key"],
        livemode: json["livemode"],
        stripeUserId: json["stripe_user_id"],
        refreshToken: json["refresh_token"],
        accessToken: json["access_token"],
      );

  Map<String, dynamic> toJson() => {
        "scope": scope,
        "issued_at": issuedAt?.toIso8601String(),
        "token_type": tokenType,
        "stripe_publishable_key": stripePublishableKey,
        "livemode": livemode,
        "stripe_user_id": stripeUserId,
        "refresh_token": refreshToken,
        "access_token": accessToken,
      };
}

class Details {
  final String? notes;
  final String? printOnCheck;
  final dynamic bankName;
  final dynamic bankSwitft;
  final dynamic bankAccountNo;
  final dynamic bankRoutingNo;
  final dynamic qbAccountCode;
  final dynamic accountCode;
  final String? userId;
  final DateTime? deauthorizedAt;

  Details({
    this.notes,
    this.printOnCheck,
    this.bankName,
    this.bankSwitft,
    this.bankAccountNo,
    this.bankRoutingNo,
    this.qbAccountCode,
    this.accountCode,
    this.userId,
    this.deauthorizedAt,
  });

  Details copyWith({
    String? notes,
    String? printOnCheck,
    dynamic bankName,
    dynamic bankSwitft,
    dynamic bankAccountNo,
    dynamic bankRoutingNo,
    dynamic qbAccountCode,
    dynamic accountCode,
    String? userId,
    DateTime? deauthorizedAt,
  }) =>
      Details(
        notes: notes ?? this.notes,
        printOnCheck: printOnCheck ?? this.printOnCheck,
        bankName: bankName ?? this.bankName,
        bankSwitft: bankSwitft ?? this.bankSwitft,
        bankAccountNo: bankAccountNo ?? this.bankAccountNo,
        bankRoutingNo: bankRoutingNo ?? this.bankRoutingNo,
        qbAccountCode: qbAccountCode ?? this.qbAccountCode,
        accountCode: accountCode ?? this.accountCode,
        userId: userId ?? this.userId,
        deauthorizedAt: deauthorizedAt ?? this.deauthorizedAt,
      );

  factory Details.fromJson(Map<String, dynamic> json) => Details(
        notes: json["notes"],
        printOnCheck: json["print_on_check"],
        bankName: json["bank_name"],
        bankSwitft: json["bank_switft"],
        bankAccountNo: json["bank_account_no"],
        bankRoutingNo: json["bank_routing_no"],
        qbAccountCode: json["qb_account_code"],
        accountCode: json["account_code"],
        userId: json["user_id"],
        deauthorizedAt: json["deauthorized_at"] == null ? null : DateTime.parse(json["deauthorized_at"]),
      );

  Map<String, dynamic> toJson() => {
        "notes": notes,
        "print_on_check": printOnCheck,
        "bank_name": bankName,
        "bank_switft": bankSwitft,
        "bank_account_no": bankAccountNo,
        "bank_routing_no": bankRoutingNo,
        "qb_account_code": qbAccountCode,
        "account_code": accountCode,
        "user_id": userId,
        "deauthorized_at": deauthorizedAt?.toIso8601String(),
      };
}

class Params {
  final dynamic expireAt;

  Params({
    this.expireAt,
  });

  Params copyWith({
    dynamic expireAt,
  }) =>
      Params(
        expireAt: expireAt ?? this.expireAt,
      );

  factory Params.fromJson(Map<String, dynamic> json) => Params(
        expireAt: json["expire_at"],
      );

  Map<String, dynamic> toJson() => {
        "expire_at": expireAt,
      };
}
