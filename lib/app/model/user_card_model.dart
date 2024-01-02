class UserCard {
  final int? id;
  final String? userType;
  final int? businessId;
  final String? orgCode;
  final int? contactId;
  final String? displayName;
  final String? firstName;
  final String? lastName;
  final String? username;
  final String? primaryEmail;
  final dynamic primaryMobile;
  final String? countryCode;
  final bool? verified;
  final String? status;
  final String? timezone;
  final String? photoUrl;
  final String? businessName;
  final String? primaryRole;
  final String? lastSeenAt;
  final String? createdAt;
  final List<Assignment>? assignments;

  UserCard({
    this.id,
    this.userType,
    this.businessId,
    this.orgCode,
    this.contactId,
    this.displayName,
    this.firstName,
    this.lastName,
    this.username,
    this.primaryEmail,
    this.primaryMobile,
    this.countryCode,
    this.verified,
    this.status,
    this.timezone,
    this.photoUrl,
    this.businessName,
    this.primaryRole,
    this.lastSeenAt,
    this.createdAt,
    this.assignments,
  });

  UserCard copyWith({
    int? id,
    String? userType,
    int? businessId,
    String? orgCode,
    int? contactId,
    String? displayName,
    String? firstName,
    String? lastName,
    String? username,
    String? primaryEmail,
    dynamic primaryMobile,
    String? countryCode,
    bool? verified,
    String? status,
    String? timezone,
    String? photoUrl,
    String? businessName,
    String? primaryRole,
    String? lastSeenAt,
    String? createdAt,
    List<Assignment>? assignments,
  }) =>
      UserCard(
        id: id ?? this.id,
        userType: userType ?? this.userType,
        businessId: businessId ?? this.businessId,
        orgCode: orgCode ?? this.orgCode,
        contactId: contactId ?? this.contactId,
        displayName: displayName ?? this.displayName,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        username: username ?? this.username,
        primaryEmail: primaryEmail ?? this.primaryEmail,
        primaryMobile: primaryMobile ?? this.primaryMobile,
        countryCode: countryCode ?? this.countryCode,
        verified: verified ?? this.verified,
        status: status ?? this.status,
        timezone: timezone ?? this.timezone,
        photoUrl: photoUrl ?? this.photoUrl,
        businessName: businessName ?? this.businessName,
        primaryRole: primaryRole ?? this.primaryRole,
        lastSeenAt: lastSeenAt ?? this.lastSeenAt,
        createdAt: createdAt ?? this.createdAt,
        assignments: assignments ?? this.assignments,
      );

  factory UserCard.fromJson(Map<String, dynamic> json) => UserCard(
        id: json["id"],
        userType: json["userType"],
        businessId: json["businessId"],
        orgCode: json["orgCode"],
        contactId: json["contactId"],
        displayName: json["displayName"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        username: json["username"],
        primaryEmail: json["primaryEmail"],
        primaryMobile: json["primaryMobile"],
        countryCode: json["countryCode"],
        verified: json["verified"],
        status: json["status"],
        timezone: json["timezone"],
        photoUrl: json["photoUrl"],
        businessName: json["businessName"],
        primaryRole: json["primaryRole"],
        lastSeenAt: json["lastSeenAt"],
        createdAt: json["createdAt"],
        assignments: json["assignments"] == null ? [] : List<Assignment>.from(json["assignments"]!.map((x) => Assignment.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userType": userType,
        "businessId": businessId,
        "orgCode": orgCode,
        "contactId": contactId,
        "displayName": displayName,
        "firstName": firstName,
        "lastName": lastName,
        "username": username,
        "primaryEmail": primaryEmail,
        "primaryMobile": primaryMobile,
        "countryCode": countryCode,
        "verified": verified,
        "status": status,
        "timezone": timezone,
        "photoUrl": photoUrl,
        "businessName": businessName,
        "primaryRole": primaryRole,
        "lastSeenAt": lastSeenAt,
        "createdAt": createdAt,
        "assignments": assignments == null ? [] : List<dynamic>.from(assignments!.map((x) => x.toJson())),
      };
}

class Assignment {
  final int? id;
  final String? groupType;
  final String? group;
  final String? role;
  final List<String>? accessModules;

  Assignment({
    this.id,
    this.groupType,
    this.group,
    this.role,
    this.accessModules,
  });

  Assignment copyWith({
    int? id,
    String? groupType,
    String? group,
    String? role,
    List<String>? accessModules,
  }) =>
      Assignment(
        id: id ?? this.id,
        groupType: groupType ?? this.groupType,
        group: group ?? this.group,
        role: role ?? this.role,
        accessModules: accessModules ?? this.accessModules,
      );

  factory Assignment.fromJson(Map<String, dynamic> json) => Assignment(
        id: json["id"],
        groupType: json["group_type"],
        group: json["group"],
        role: json["role"],
        accessModules: json["access_modules"] == null ? [] : List<String>.from(json["access_modules"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "group_type": groupType,
        "group": group,
        "role": role,
        "access_modules": accessModules == null ? [] : List<dynamic>.from(accessModules!.map((x) => x)),
      };
}
