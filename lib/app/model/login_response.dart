class LoginResponse {
  final Data? data;
  final String? redirect;

  LoginResponse({
    this.data,
    this.redirect,
  });

  LoginResponse copyWith({
    Data? data,
    String? redirect,
  }) =>
      LoginResponse(
        data: data ?? this.data,
        redirect: redirect ?? this.redirect,
      );

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        data: json['data'] == null ? null : Data.fromJson(json['data'] as Map<String, dynamic>),
        redirect: json['redirect'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'data': data?.toJson(),
        'redirect': redirect,
      };
}

class Data {
  final int? id;
  final String? userType;
  final String? orgCode;
  final int? businessId;
  final String? displayName;
  final String? username;
  final String? countryCode;
  final String? photoUrl;
  final String? refCode;
  final Details? details;
  final int? verified;
  final String? status;
  final Pref? pref;
  final String? uniqid;
  final String? accessToken;
  final DateTime? createdAt;

  Data({
    this.id,
    this.userType,
    this.orgCode,
    this.businessId,
    this.displayName,
    this.username,
    this.countryCode,
    this.photoUrl,
    this.refCode,
    this.details,
    this.verified,
    this.status,
    this.pref,
    this.uniqid,
    this.accessToken,
    this.createdAt,
  });

  Data copyWith({
    int? id,
    String? userType,
    String? orgCode,
    int? businessId,
    String? displayName,
    String? username,
    String? countryCode,
    String? photoUrl,
    String? refCode,
    Details? details,
    int? verified,
    String? status,
    Pref? pref,
    String? uniqid,
    String? accessToken,
    DateTime? createdAt,
  }) =>
      Data(
        id: id ?? this.id,
        userType: userType ?? this.userType,
        orgCode: orgCode ?? this.orgCode,
        businessId: businessId ?? this.businessId,
        displayName: displayName ?? this.displayName,
        username: username ?? this.username,
        countryCode: countryCode ?? this.countryCode,
        photoUrl: photoUrl ?? this.photoUrl,
        refCode: refCode ?? this.refCode,
        details: details ?? this.details,
        verified: verified ?? this.verified,
        status: status ?? this.status,
        pref: pref ?? this.pref,
        uniqid: uniqid ?? this.uniqid,
        accessToken: accessToken ?? this.accessToken,
        createdAt: createdAt ?? this.createdAt,
      );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json['id'] as int?,
        userType: json['user_type'] as String?,
        orgCode: json['org_code'] as String?,
        businessId: json['business_id'] as int?,
        displayName: json['display_name'] as String?,
        username: json['username'] as String?,
        countryCode: json['country_code'] as String?,
        photoUrl: json['photo_url'] as String?,
        refCode: json['ref_code'] as String?,
        details: json['details'] == null ? null : Details.fromJson(json['details'] as Map<String, dynamic>),
        verified: json['verified'] as int?,
        status: json['status'] as String?,
        pref: json['pref'] == null ? null : Pref.fromJson(json['pref'] as Map<String, dynamic>),
        uniqid: json['uniqid'] as String?,
        accessToken: json['access_token'] as String?,
        createdAt: json['created_at'] == null ? null : DateTime.parse(json['created_at'] as String),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'user_type': userType,
        'org_code': orgCode,
        'business_id': businessId,
        'display_name': displayName,
        'username': username,
        'country_code': countryCode,
        'photo_url': photoUrl,
        'ref_code': refCode,
        'details': details?.toJson(),
        'verified': verified,
        'status': status,
        'pref': pref?.toJson(),
        'uniqid': uniqid,
        'access_token': accessToken,
        'created_at': createdAt?.toIso8601String(),
      };
}

class Details {
  final String? firstName;
  final String? lastName;
  final String? locationCountry;
  final String? primaryEmail;
  final dynamic primaryMobile;
  final String? title;
  final String? gender;
  final dynamic dateOfBirth;
  final String? color;
  final dynamic idType;
  final dynamic idNo;
  final dynamic idPhoto;
  final dynamic optionalEmail;
  final dynamic countryName;
  final dynamic website;
  final dynamic twitter;
  final dynamic facebook;

  Details({
    this.firstName,
    this.lastName,
    this.locationCountry,
    this.primaryEmail,
    this.primaryMobile,
    this.title,
    this.gender,
    this.dateOfBirth,
    this.color,
    this.idType,
    this.idNo,
    this.idPhoto,
    this.optionalEmail,
    this.countryName,
    this.website,
    this.twitter,
    this.facebook,
  });

  Details copyWith({
    String? firstName,
    String? lastName,
    String? locationCountry,
    String? primaryEmail,
    dynamic primaryMobile,
    String? title,
    String? gender,
    dynamic dateOfBirth,
    String? color,
    dynamic idType,
    dynamic idNo,
    dynamic idPhoto,
    dynamic optionalEmail,
    dynamic countryName,
    dynamic website,
    dynamic twitter,
    dynamic facebook,
  }) =>
      Details(
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        locationCountry: locationCountry ?? this.locationCountry,
        primaryEmail: primaryEmail ?? this.primaryEmail,
        primaryMobile: primaryMobile ?? this.primaryMobile,
        title: title ?? this.title,
        gender: gender ?? this.gender,
        dateOfBirth: dateOfBirth ?? this.dateOfBirth,
        color: color ?? this.color,
        idType: idType ?? this.idType,
        idNo: idNo ?? this.idNo,
        idPhoto: idPhoto ?? this.idPhoto,
        optionalEmail: optionalEmail ?? this.optionalEmail,
        countryName: countryName ?? this.countryName,
        website: website ?? this.website,
        twitter: twitter ?? this.twitter,
        facebook: facebook ?? this.facebook,
      );

  factory Details.fromJson(Map<String, dynamic> json) => Details(
        firstName: json['first_name'] as String?,
        lastName: json['last_name'] as String?,
        locationCountry: json['location_country'] as String?,
        primaryEmail: json['primary_email'] as String?,
        primaryMobile: json['primary_mobile'],
        title: json['title'] as String?,
        gender: json['gender'] as String?,
        dateOfBirth: json['date_of_birth'],
        color: json['color'] as String?,
        idType: json['id_type'],
        idNo: json['id_no'],
        idPhoto: json['id_photo'],
        optionalEmail: json['optional_email'],
        countryName: json['country_name'],
        website: json['website'],
        twitter: json['twitter'],
        facebook: json['facebook'],
      );

  Map<String, dynamic> toJson() => {
        'first_name': firstName,
        'last_name': lastName,
        'location_country': locationCountry,
        'primary_email': primaryEmail,
        'primary_mobile': primaryMobile,
        'title': title,
        'gender': gender,
        'date_of_birth': dateOfBirth,
        'color': color,
        'id_type': idType,
        'id_no': idNo,
        'id_photo': idPhoto,
        'optional_email': optionalEmail,
        'country_name': countryName,
        'website': website,
        'twitter': twitter,
        'facebook': facebook,
      };
}

class Pref {
  final String? timezone;
  final String? currency;
  final String? singlePassword;
  final bool? use2Fa;
  final dynamic commissionTier;
  final dynamic agreedToTnc;

  Pref({
    this.timezone,
    this.currency,
    this.singlePassword,
    this.use2Fa,
    this.commissionTier,
    this.agreedToTnc,
  });

  Pref copyWith({
    String? timezone,
    String? currency,
    String? singlePassword,
    bool? use2Fa,
    dynamic commissionTier,
    dynamic agreedToTnc,
  }) =>
      Pref(
        timezone: timezone ?? this.timezone,
        currency: currency ?? this.currency,
        singlePassword: singlePassword ?? this.singlePassword,
        use2Fa: use2Fa ?? this.use2Fa,
        commissionTier: commissionTier ?? this.commissionTier,
        agreedToTnc: agreedToTnc ?? this.agreedToTnc,
      );

  factory Pref.fromJson(Map<String, dynamic> json) => Pref(
        timezone: json['timezone'] as String?,
        currency: json['currency'] as String?,
        singlePassword: json['single_password'] as String?,
        use2Fa: json['use_2fa'] as bool?,
        commissionTier: json['commission_tier'],
        agreedToTnc: json['agreed_to_tnc'],
      );

  Map<String, dynamic> toJson() => {
        'timezone': timezone,
        'currency': currency,
        'single_password': singlePassword,
        'use_2fa': use2Fa,
        'commission_tier': commissionTier,
        'agreed_to_tnc': agreedToTnc,
      };
}
