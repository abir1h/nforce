class AccountStatus {
  final Data? data;

  AccountStatus({
    this.data,
  });

  AccountStatus copyWith({
    Data? data,
  }) =>
      AccountStatus(
        data: data ?? this.data,
      );

  factory AccountStatus.fromJson(Map<String, dynamic> json) => AccountStatus(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
      };
}

class Data {
  final int? userId;
  final String? displayName;
  final String? countryCode;
  final String? primaryEmail;
  final String? primaryMobile;
  final String? status;
  final bool? verified;
  final dynamic businessId;

  Data({
    this.userId,
    this.displayName,
    this.countryCode,
    this.primaryEmail,
    this.primaryMobile,
    this.status,
    this.verified,
    this.businessId,
  });

  Data copyWith({
    int? userId,
    String? displayName,
    String? countryCode,
    String? primaryEmail,
    String? primaryMobile,
    String? status,
    bool? verified,
    dynamic businessId,
  }) =>
      Data(
        userId: userId ?? this.userId,
        displayName: displayName ?? this.displayName,
        countryCode: countryCode ?? this.countryCode,
        primaryEmail: primaryEmail ?? this.primaryEmail,
        primaryMobile: primaryMobile ?? this.primaryMobile,
        status: status ?? this.status,
        verified: verified ?? this.verified,
        businessId: businessId ?? this.businessId,
      );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        userId: json["user_id"],
        displayName: json["display_name"],
        countryCode: json["country_code"],
        primaryEmail: json["primary_email"],
        primaryMobile: json["primary_mobile"],
        status: json["status"],
        verified: json["verified"],
        businessId: json["business_id"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "display_name": displayName,
        "country_code": countryCode,
        "primary_email": primaryEmail,
        "primary_mobile": primaryMobile,
        "status": status,
        "verified": verified,
        "business_id": businessId,
      };
}
