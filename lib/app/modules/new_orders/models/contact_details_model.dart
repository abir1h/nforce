class ContactDetails {
  final Contact? contact;
  final List<Address>? address;
  final List<Email>? phones;
  final List<Email>? emails;
  final List<Date>? dates;
  final List<Email>? notes;
  final List<Date>? licenses;
  final List<Email>? regions;

  ContactDetails({
    this.contact,
    this.address,
    this.phones,
    this.emails,
    this.dates,
    this.notes,
    this.licenses,
    this.regions,
  });

  ContactDetails copyWith({
    Contact? contact,
    List<Address>? address,
    List<Email>? phones,
    List<Email>? emails,
    List<Date>? dates,
    List<Email>? notes,
    List<Date>? licenses,
    List<Email>? regions,
  }) =>
      ContactDetails(
        contact: contact ?? this.contact,
        address: address ?? this.address,
        phones: phones ?? this.phones,
        emails: emails ?? this.emails,
        dates: dates ?? this.dates,
        notes: notes ?? this.notes,
        licenses: licenses ?? this.licenses,
        regions: regions ?? this.regions,
      );

  factory ContactDetails.fromJson(Map<String, dynamic> json) => ContactDetails(
        contact: json["contact"] == null ? null : Contact.fromJson(json["contact"]),
        address: json["address"] == null ? [] : List<Address>.from(json["address"]!.map((x) => Address.fromJson(x))),
        phones: json["phones"] == null ? [] : List<Email>.from(json["phones"]!.map((x) => Email.fromJson(x))),
        emails: json["emails"] == null ? [] : List<Email>.from(json["emails"]!.map((x) => Email.fromJson(x))),
        dates: json["dates"] == null ? [] : List<Date>.from(json["dates"]!.map((x) => Date.fromJson(x))),
        notes: json["notes"] == null ? [] : List<Email>.from(json["notes"]!.map((x) => Email.fromJson(x))),
        licenses: json["licenses"] == null ? [] : List<Date>.from(json["licenses"]!.map((x) => Date.fromJson(x))),
        regions: json["regions"] == null ? [] : List<Email>.from(json["regions"]!.map((x) => Email.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "contact": contact?.toJson(),
        "address": address == null ? [] : List<dynamic>.from(address!.map((x) => x.toJson())),
        "phones": phones == null ? [] : List<dynamic>.from(phones!.map((x) => x.toJson())),
        "emails": emails == null ? [] : List<dynamic>.from(emails!.map((x) => x.toJson())),
        "dates": dates == null ? [] : List<dynamic>.from(dates!.map((x) => x.toJson())),
        "notes": notes == null ? [] : List<dynamic>.from(notes!.map((x) => x.toJson())),
        "licenses": licenses == null ? [] : List<dynamic>.from(licenses!.map((x) => x.toJson())),
        "regions": regions == null ? [] : List<dynamic>.from(regions!.map((x) => x.toJson())),
      };
}

class Address {
  final int? id;
  final String? purpose;
  final int? contactId;
  final String? name;
  final dynamic jobTitle;
  final dynamic company;
  final String? email;
  final String? mobile;
  final String? address;
  final Location? location;
  final String? addressLine1;
  final dynamic addressLine2;
  final String? city;
  final String? region;
  final String? regionCode;
  final String? postalCode;
  final String? country;
  final dynamic notes;

  Address({
    this.id,
    this.purpose,
    this.contactId,
    this.name,
    this.jobTitle,
    this.company,
    this.email,
    this.mobile,
    this.address,
    this.location,
    this.addressLine1,
    this.addressLine2,
    this.city,
    this.region,
    this.regionCode,
    this.postalCode,
    this.country,
    this.notes,
  });

  Address copyWith({
    int? id,
    String? purpose,
    int? contactId,
    String? name,
    dynamic jobTitle,
    dynamic company,
    String? email,
    String? mobile,
    String? address,
    Location? location,
    String? addressLine1,
    dynamic addressLine2,
    String? city,
    String? region,
    String? regionCode,
    String? postalCode,
    String? country,
    dynamic notes,
  }) =>
      Address(
        id: id ?? this.id,
        purpose: purpose ?? this.purpose,
        contactId: contactId ?? this.contactId,
        name: name ?? this.name,
        jobTitle: jobTitle ?? this.jobTitle,
        company: company ?? this.company,
        email: email ?? this.email,
        mobile: mobile ?? this.mobile,
        address: address ?? this.address,
        location: location ?? this.location,
        addressLine1: addressLine1 ?? this.addressLine1,
        addressLine2: addressLine2 ?? this.addressLine2,
        city: city ?? this.city,
        region: region ?? this.region,
        regionCode: regionCode ?? this.regionCode,
        postalCode: postalCode ?? this.postalCode,
        country: country ?? this.country,
        notes: notes ?? this.notes,
      );

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        id: json["id"],
        purpose: json["purpose"],
        contactId: json["contact_id"],
        name: json["name"],
        jobTitle: json["job_title"],
        company: json["company"],
        email: json["email"],
        mobile: json["mobile"],
        address: json["address"],
        location: json["location"] == null ? null : Location.fromJson(json["location"]),
        addressLine1: json["address_line1"],
        addressLine2: json["address_line2"],
        city: json["city"],
        region: json["region"],
        regionCode: json["region_code"],
        postalCode: json["postal_code"],
        country: json["country"],
        notes: json["notes"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "purpose": purpose,
        "contact_id": contactId,
        "name": name,
        "job_title": jobTitle,
        "company": company,
        "email": email,
        "mobile": mobile,
        "address": address,
        "location": location?.toJson(),
        "address_line1": addressLine1,
        "address_line2": addressLine2,
        "city": city,
        "region": region,
        "region_code": regionCode,
        "postal_code": postalCode,
        "country": country,
        "notes": notes,
      };
}

class Location {
  final String? lat;
  final String? lng;

  Location({
    this.lat,
    this.lng,
  });

  Location copyWith({
    String? lat,
    String? lng,
  }) =>
      Location(
        lat: lat ?? this.lat,
        lng: lng ?? this.lng,
      );

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        lat: json["lat"],
        lng: json["lng"],
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lng": lng,
      };
}

class Contact {
  final int? id;
  final String? name;
  final dynamic ownerName;
  final String? groupName;
  final int? groupId;
  final bool? businessContact;
  final dynamic company;
  final String? primaryEmail;
  final String? primaryMobile;
  final int? quickBooksId;

  Contact({
    this.id,
    this.name,
    this.ownerName,
    this.groupName,
    this.groupId,
    this.businessContact,
    this.company,
    this.primaryEmail,
    this.primaryMobile,
    this.quickBooksId,
  });

  Contact copyWith({
    int? id,
    String? name,
    dynamic ownerName,
    String? groupName,
    int? groupId,
    bool? businessContact,
    dynamic company,
    String? primaryEmail,
    String? primaryMobile,
    int? quickBooksId,
  }) =>
      Contact(
        id: id ?? this.id,
        name: name ?? this.name,
        ownerName: ownerName ?? this.ownerName,
        groupName: groupName ?? this.groupName,
        groupId: groupId ?? this.groupId,
        businessContact: businessContact ?? this.businessContact,
        company: company ?? this.company,
        primaryEmail: primaryEmail ?? this.primaryEmail,
        primaryMobile: primaryMobile ?? this.primaryMobile,
        quickBooksId: quickBooksId ?? this.quickBooksId,
      );

  factory Contact.fromJson(Map<String, dynamic> json) => Contact(
        id: json["id"],
        name: json["name"],
        ownerName: json["ownerName"],
        groupName: json["groupName"],
        groupId: json["groupId"],
        businessContact: json["businessContact"],
        company: json["company"],
        primaryEmail: json["primaryEmail"],
        primaryMobile: json["primaryMobile"],
        quickBooksId: json["quickBooksId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "ownerName": ownerName,
        "groupName": groupName,
        "groupId": groupId,
        "businessContact": businessContact,
        "company": company,
        "primaryEmail": primaryEmail,
        "primaryMobile": primaryMobile,
        "quickBooksId": quickBooksId,
      };
}

class Date {
  final int? id;
  final String? label;
  final String? detailType;
  final DateTime? eventDate;
  final String? description;

  Date({
    this.id,
    this.label,
    this.detailType,
    this.eventDate,
    this.description,
  });

  Date copyWith({
    int? id,
    String? label,
    String? detailType,
    DateTime? eventDate,
    String? description,
  }) =>
      Date(
        id: id ?? this.id,
        label: label ?? this.label,
        detailType: detailType ?? this.detailType,
        eventDate: eventDate ?? this.eventDate,
        description: description ?? this.description,
      );

  factory Date.fromJson(Map<String, dynamic> json) => Date(
        id: json["id"],
        label: json["label"],
        detailType: json["detail_type"],
        eventDate: json["event_date"] == null ? null : DateTime.parse(json["event_date"]),
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "label": label,
        "detail_type": detailType,
        "event_date": "${eventDate!.year.toString().padLeft(4, '0')}-${eventDate!.month.toString().padLeft(2, '0')}-${eventDate!.day.toString().padLeft(2, '0')}",
        "description": description,
      };
}

class Email {
  final int? id;
  final String? label;
  final String? detailType;
  final String? email;
  final String? note;
  final String? phone;
  final String? regionId;

  Email({
    this.id,
    this.label,
    this.detailType,
    this.email,
    this.note,
    this.phone,
    this.regionId,
  });

  Email copyWith({
    int? id,
    String? label,
    String? detailType,
    String? email,
    String? note,
    String? phone,
    String? regionId,
  }) =>
      Email(
        id: id ?? this.id,
        label: label ?? this.label,
        detailType: detailType ?? this.detailType,
        email: email ?? this.email,
        note: note ?? this.note,
        phone: phone ?? this.phone,
        regionId: regionId ?? this.regionId,
      );

  factory Email.fromJson(Map<String, dynamic> json) => Email(
        id: json["id"],
        label: json["label"],
        detailType: json["detail_type"],
        email: json["email"],
        note: json["note"],
        phone: json["phone"],
        regionId: json["region_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "label": label,
        "detail_type": detailType,
        "email": email,
        "note": note,
        "phone": phone,
        "region_id": regionId,
      };
}
