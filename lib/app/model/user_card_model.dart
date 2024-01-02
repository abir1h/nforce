class UserCard {
  int? id;
  String? userType;
  int? businessId;
  String? orgCode;
  int? contactId;
  String? displayName;
  String? firstName;
  String? lastName;
  String? username;
  String? primaryEmail;
  dynamic primaryMobile;
  String? countryCode;
  bool? verified;
  String? status;
  String? timezone;
  String? photoUrl;
  String? businessName;
  String? primaryRole;
  String? lastSeenAt;
  String? createdAt;
  List<Assignments>? assignments;

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

  UserCard.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    userType = json['userType'] as String?;
    businessId = json['businessId'] as int?;
    orgCode = json['orgCode'] as String?;
    contactId = json['contactId'] as int?;
    displayName = json['displayName'] as String?;
    firstName = json['firstName'] as String?;
    lastName = json['lastName'] as String?;
    username = json['username'] as String?;
    primaryEmail = json['primaryEmail'] as String?;
    primaryMobile = json['primaryMobile'] as dynamic;
    countryCode = json['countryCode'] as String?;
    verified = json['verified'] as bool?;
    status = json['status'] as String?;
    timezone = json['timezone'] as String?;
    photoUrl = json['photoUrl'] as String?;
    businessName = json['businessName'] as String?;
    primaryRole = json['primaryRole'] as String?;
    lastSeenAt = json['lastSeenAt'] as String?;
    createdAt = json['createdAt'] as String?;
    if (json['assignments'] != null) {
      assignments = <Assignments>[];
      final jsonAssignments = json['assignments'] as Iterable<dynamic>;
      for (final assignment in jsonAssignments) {
        assignments!.add(Assignments.fromJson(assignment as Map<String, dynamic>));
      }
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['userType'] = userType;
    data['businessId'] = businessId;
    data['orgCode'] = orgCode;
    data['contactId'] = contactId;
    data['displayName'] = displayName;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['username'] = username;
    data['primaryEmail'] = primaryEmail;
    data['primaryMobile'] = primaryMobile;
    data['countryCode'] = countryCode;
    data['verified'] = verified;
    data['status'] = status;
    data['timezone'] = timezone;
    data['photoUrl'] = photoUrl;
    data['businessName'] = businessName;
    data['primaryRole'] = primaryRole;
    data['lastSeenAt'] = lastSeenAt;
    data['createdAt'] = createdAt;
    if (assignments != null) {
      data['assignments'] = assignments!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Assignments {
  int? id;
  String? groupType;
  String? group;
  String? role;
  List<String>? accessModules;

  Assignments({this.id, this.groupType, this.group, this.role, this.accessModules});

  Assignments.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    groupType = json['group_type'] as String?;
    group = json['group'] as String?;
    role = json['role'] as String?;
    accessModules = json['access_modules'].cast<String>() as List<String>?;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['group_type'] = groupType;
    data['group'] = group;
    data['role'] = role;
    data['access_modules'] = accessModules;
    return data;
  }
}
