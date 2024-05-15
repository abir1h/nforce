class InvoiceScheduleModel {
  final List<Datum>? data;

  InvoiceScheduleModel({
    this.data,
  });

  InvoiceScheduleModel copyWith({
    List<Datum>? data,
  }) =>
      InvoiceScheduleModel(
        data: data ?? this.data,
      );

  factory InvoiceScheduleModel.fromJson(Map<String, dynamic> json) => InvoiceScheduleModel(
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  final int? id;
  final int? businessId;
  final String? owner;
  final int? calendarId;
  final int? addressId;
  final dynamic regionId;
  final dynamic projectId;
  final String? eventType;
  final int? recurringEvent;
  final String? mode;
  final String? period;
  final dynamic step;
  final String? name;
  final dynamic description;
  final DateTime? startOn;
  final String? startTime;
  final String? timezone;
  final int? allDayEvent;
  final DateTime? endOn;
  final String? endTime;
  final dynamic alertAt;
  final dynamic travelTime;
  final dynamic duration;
  final dynamic alertBefore;
  final dynamic alertPriority;
  final dynamic color;
  final dynamic notes;
  final dynamic url;
  final dynamic dateRange;
  final dynamic weekDays;
  final int? createdBy;
  final dynamic archived;
  final dynamic attachments;
  final String? orgCode;
  final dynamic workorderNo;
  final DateTime? startAt;
  final DateTime? endAt;
  final String? calendarName;
  final dynamic projectName;
  final String? ownerName;
  final String? ownerType;
  final bool? timeUnspecified;
  final bool? endOnSameDay;
  final String? timeRange;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? eventId;
  final dynamic userIds;
  final Contact? contact;
  final Location? location;
  final List<dynamic>? attendees;
  final OwnerSummary? ownerSummary;

  Datum({
    this.id,
    this.businessId,
    this.owner,
    this.calendarId,
    this.addressId,
    this.regionId,
    this.projectId,
    this.eventType,
    this.recurringEvent,
    this.mode,
    this.period,
    this.step,
    this.name,
    this.description,
    this.startOn,
    this.startTime,
    this.timezone,
    this.allDayEvent,
    this.endOn,
    this.endTime,
    this.alertAt,
    this.travelTime,
    this.duration,
    this.alertBefore,
    this.alertPriority,
    this.color,
    this.notes,
    this.url,
    this.dateRange,
    this.weekDays,
    this.createdBy,
    this.archived,
    this.attachments,
    this.orgCode,
    this.workorderNo,
    this.startAt,
    this.endAt,
    this.calendarName,
    this.projectName,
    this.ownerName,
    this.ownerType,
    this.timeUnspecified,
    this.endOnSameDay,
    this.timeRange,
    this.createdAt,
    this.updatedAt,
    this.eventId,
    this.userIds,
    this.contact,
    this.location,
    this.attendees,
    this.ownerSummary,
  });

  Datum copyWith({
    int? id,
    int? businessId,
    String? owner,
    int? calendarId,
    int? addressId,
    dynamic regionId,
    dynamic projectId,
    String? eventType,
    int? recurringEvent,
    String? mode,
    String? period,
    dynamic step,
    String? name,
    dynamic description,
    DateTime? startOn,
    String? startTime,
    String? timezone,
    int? allDayEvent,
    DateTime? endOn,
    String? endTime,
    dynamic alertAt,
    dynamic travelTime,
    dynamic duration,
    dynamic alertBefore,
    dynamic alertPriority,
    dynamic color,
    dynamic notes,
    dynamic url,
    dynamic dateRange,
    dynamic weekDays,
    int? createdBy,
    dynamic archived,
    dynamic attachments,
    String? orgCode,
    dynamic workorderNo,
    DateTime? startAt,
    DateTime? endAt,
    String? calendarName,
    dynamic projectName,
    String? ownerName,
    String? ownerType,
    bool? timeUnspecified,
    bool? endOnSameDay,
    String? timeRange,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? eventId,
    dynamic userIds,
    Contact? contact,
    Location? location,
    List<dynamic>? attendees,
    OwnerSummary? ownerSummary,
  }) =>
      Datum(
        id: id ?? this.id,
        businessId: businessId ?? this.businessId,
        owner: owner ?? this.owner,
        calendarId: calendarId ?? this.calendarId,
        addressId: addressId ?? this.addressId,
        regionId: regionId ?? this.regionId,
        projectId: projectId ?? this.projectId,
        eventType: eventType ?? this.eventType,
        recurringEvent: recurringEvent ?? this.recurringEvent,
        mode: mode ?? this.mode,
        period: period ?? this.period,
        step: step ?? this.step,
        name: name ?? this.name,
        description: description ?? this.description,
        startOn: startOn ?? this.startOn,
        startTime: startTime ?? this.startTime,
        timezone: timezone ?? this.timezone,
        allDayEvent: allDayEvent ?? this.allDayEvent,
        endOn: endOn ?? this.endOn,
        endTime: endTime ?? this.endTime,
        alertAt: alertAt ?? this.alertAt,
        travelTime: travelTime ?? this.travelTime,
        duration: duration ?? this.duration,
        alertBefore: alertBefore ?? this.alertBefore,
        alertPriority: alertPriority ?? this.alertPriority,
        color: color ?? this.color,
        notes: notes ?? this.notes,
        url: url ?? this.url,
        dateRange: dateRange ?? this.dateRange,
        weekDays: weekDays ?? this.weekDays,
        createdBy: createdBy ?? this.createdBy,
        archived: archived ?? this.archived,
        attachments: attachments ?? this.attachments,
        orgCode: orgCode ?? this.orgCode,
        workorderNo: workorderNo ?? this.workorderNo,
        startAt: startAt ?? this.startAt,
        endAt: endAt ?? this.endAt,
        calendarName: calendarName ?? this.calendarName,
        projectName: projectName ?? this.projectName,
        ownerName: ownerName ?? this.ownerName,
        ownerType: ownerType ?? this.ownerType,
        timeUnspecified: timeUnspecified ?? this.timeUnspecified,
        endOnSameDay: endOnSameDay ?? this.endOnSameDay,
        timeRange: timeRange ?? this.timeRange,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        eventId: eventId ?? this.eventId,
        userIds: userIds ?? this.userIds,
        contact: contact ?? this.contact,
        location: location ?? this.location,
        attendees: attendees ?? this.attendees,
        ownerSummary: ownerSummary ?? this.ownerSummary,
      );

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        businessId: json["business_id"],
        owner: json["owner"],
        calendarId: json["calendar_id"],
        addressId: json["address_id"],
        regionId: json["region_id"],
        projectId: json["project_id"],
        eventType: json["event_type"],
        recurringEvent: json["recurring_event"],
        mode: json["mode"],
        period: json["period"],
        step: json["step"],
        name: json["name"],
        description: json["description"],
        startOn: json["start_on"] == null ? null : DateTime.parse(json["start_on"]),
        startTime: json["start_time"],
        timezone: json["timezone"],
        allDayEvent: json["all_day_event"],
        endOn: json["end_on"] == null ? null : DateTime.parse(json["end_on"]),
        endTime: json["end_time"],
        alertAt: json["alert_at"],
        travelTime: json["travel_time"],
        duration: json["duration"],
        alertBefore: json["alert_before"],
        alertPriority: json["alert_priority"],
        color: json["color"],
        notes: json["notes"],
        url: json["url"],
        dateRange: json["date_range"],
        weekDays: json["week_days"],
        createdBy: json["created_by"],
        archived: json["archived"],
        attachments: json["attachments"],
        orgCode: json["org_code"],
        workorderNo: json["workorder_no"],
        startAt: json["start_at"] == null ? null : DateTime.parse(json["start_at"]),
        endAt: json["end_at"] == null ? null : DateTime.parse(json["end_at"]),
        calendarName: json["calendar_name"],
        projectName: json["project_name"],
        ownerName: json["owner_name"],
        ownerType: json["owner_type"],
        timeUnspecified: json["time_unspecified"],
        endOnSameDay: json["end_on_same_day"],
        timeRange: json["time_range"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        eventId: json["event_id"],
        userIds: json["user_ids"],
        contact: json["contact"] == null ? null : Contact.fromJson(json["contact"]),
        location: json["location"] == null ? null : Location.fromJson(json["location"]),
        attendees: json["attendees"] == null ? [] : List<dynamic>.from(json["attendees"]!.map((x) => x)),
        ownerSummary: json["owner_summary"] == null ? null : OwnerSummary.fromJson(json["owner_summary"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "business_id": businessId,
        "owner": owner,
        "calendar_id": calendarId,
        "address_id": addressId,
        "region_id": regionId,
        "project_id": projectId,
        "event_type": eventType,
        "recurring_event": recurringEvent,
        "mode": mode,
        "period": period,
        "step": step,
        "name": name,
        "description": description,
        "start_on": "${startOn!.year.toString().padLeft(4, '0')}-${startOn!.month.toString().padLeft(2, '0')}-${startOn!.day.toString().padLeft(2, '0')}",
        "start_time": startTime,
        "timezone": timezone,
        "all_day_event": allDayEvent,
        "end_on": "${endOn!.year.toString().padLeft(4, '0')}-${endOn!.month.toString().padLeft(2, '0')}-${endOn!.day.toString().padLeft(2, '0')}",
        "end_time": endTime,
        "alert_at": alertAt,
        "travel_time": travelTime,
        "duration": duration,
        "alert_before": alertBefore,
        "alert_priority": alertPriority,
        "color": color,
        "notes": notes,
        "url": url,
        "date_range": dateRange,
        "week_days": weekDays,
        "created_by": createdBy,
        "archived": archived,
        "attachments": attachments,
        "org_code": orgCode,
        "workorder_no": workorderNo,
        "start_at": startAt?.toIso8601String(),
        "end_at": endAt?.toIso8601String(),
        "calendar_name": calendarName,
        "project_name": projectName,
        "owner_name": ownerName,
        "owner_type": ownerType,
        "time_unspecified": timeUnspecified,
        "end_on_same_day": endOnSameDay,
        "time_range": timeRange,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "event_id": eventId,
        "user_ids": userIds,
        "contact": contact?.toJson(),
        "location": location?.toJson(),
        "attendees": attendees == null ? [] : List<dynamic>.from(attendees!.map((x) => x)),
        "owner_summary": ownerSummary?.toJson(),
      };
}

class Contact {
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

  Contact({
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

  Contact copyWith({
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
      Contact(
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

  factory Contact.fromJson(Map<String, dynamic> json) => Contact(
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
  final double? lat;
  final double? lng;

  Location({
    this.lat,
    this.lng,
  });

  Location copyWith({
    double? lat,
    double? lng,
  }) =>
      Location(
        lat: lat ?? this.lat,
        lng: lng ?? this.lng,
      );

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        lat: json["lat"]?.toDouble(),
        lng: json["lng"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lng": lng,
      };
}

class OwnerSummary {
  final dynamic name;
  final String? workOrderNo;
  final String? workOrderType;
  final String? status;
  final String? totalAmount;
  final String? previewUrl;
  final String? invoiceNo;
  final dynamic paid;
  final String? invoiceUrl;

  OwnerSummary({
    this.name,
    this.workOrderNo,
    this.workOrderType,
    this.status,
    this.totalAmount,
    this.previewUrl,
    this.invoiceNo,
    this.paid,
    this.invoiceUrl,
  });

  OwnerSummary copyWith({
    dynamic name,
    String? workOrderNo,
    String? workOrderType,
    String? status,
    String? totalAmount,
    String? previewUrl,
    String? invoiceNo,
    dynamic paid,
    String? invoiceUrl,
  }) =>
      OwnerSummary(
        name: name ?? this.name,
        workOrderNo: workOrderNo ?? this.workOrderNo,
        workOrderType: workOrderType ?? this.workOrderType,
        status: status ?? this.status,
        totalAmount: totalAmount ?? this.totalAmount,
        previewUrl: previewUrl ?? this.previewUrl,
        invoiceNo: invoiceNo ?? this.invoiceNo,
        paid: paid ?? this.paid,
        invoiceUrl: invoiceUrl ?? this.invoiceUrl,
      );

  factory OwnerSummary.fromJson(Map<String, dynamic> json) => OwnerSummary(
        name: json["name"],
        workOrderNo: json["work_order_no"],
        workOrderType: json["work_order_type"],
        status: json["status"],
        totalAmount: json["total_amount"],
        previewUrl: json["preview_url"],
        invoiceNo: json["invoice_no"],
        paid: json["paid"],
        invoiceUrl: json["invoice_url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "work_order_no": workOrderNo,
        "work_order_type": workOrderType,
        "status": status,
        "total_amount": totalAmount,
        "preview_url": previewUrl,
        "invoice_no": invoiceNo,
        "paid": paid,
        "invoice_url": invoiceUrl,
      };
}
