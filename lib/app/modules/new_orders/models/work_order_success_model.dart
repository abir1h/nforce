class WorkOrderSuccessModel {
  final bool? error;
  final String? success;
  final Invoice? invoice;

  WorkOrderSuccessModel({
    this.error,
    this.success,
    this.invoice,
  });

  WorkOrderSuccessModel copyWith({
    bool? error,
    String? success,
    Invoice? data,
  }) =>
      WorkOrderSuccessModel(
        error: error ?? this.error,
        success: success ?? this.success,
        invoice: data ?? invoice,
      );

  factory WorkOrderSuccessModel.fromJson(Map<String, dynamic> json) => WorkOrderSuccessModel(
        error: json["error"],
        success: json["success"],
        invoice: json["data"] == null ? null : Invoice.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "success": success,
        "data": invoice?.toJson(),
      };
}

class Invoice {
  final int? id;
  final int? businessId;
  final int? contactId;
  final dynamic projectId;
  final String? invoiceNo;
  final String? invoiceType;
  final int? addressId;
  final int? regionId;
  final int? billingAddressId;
  final dynamic origin;
  final dynamic refCode;
  final String? owner;
  final dynamic description;
  final int? serviceId;
  final String? currency;
  final dynamic issuedOn;
  final DateTime? dueDate;
  final String? dueOn;
  final dynamic subTotalCost;
  final dynamic subTotalTaxableCost;
  final dynamic totalCost;
  final dynamic grandTotalCost;
  final dynamic applyDiscount;
  final dynamic applyTax;
  final String? cancellationFee;
  final dynamic amountDue;
  final dynamic amountPaid;
  final String? status;
  final String? locked;
  final dynamic paid;
  final String? uniqid;
  final Details? details;
  final bool? isWorkorderInvoice;
  final bool? isIssued;
  final int? countLineItems;
  final InvoiceContact? invoiceContact;
  final InvoiceCompany? invoiceCompany;
  final Address? billingAddress;
  final Address? serviceAddress;
  final String? viewerUrl;
  final String? exportPdf;
  final dynamic policies;
  final dynamic expiresOn;
  final String? serviceName;
  final Params? params;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Invoice({
    this.id,
    this.businessId,
    this.contactId,
    this.projectId,
    this.invoiceNo,
    this.invoiceType,
    this.addressId,
    this.regionId,
    this.billingAddressId,
    this.origin,
    this.refCode,
    this.owner,
    this.description,
    this.serviceId,
    this.currency,
    this.issuedOn,
    this.dueDate,
    this.dueOn,
    this.subTotalCost,
    this.subTotalTaxableCost,
    this.totalCost,
    this.grandTotalCost,
    this.applyDiscount,
    this.applyTax,
    this.cancellationFee,
    this.amountDue,
    this.amountPaid,
    this.status,
    this.locked,
    this.paid,
    this.uniqid,
    this.details,
    this.isWorkorderInvoice,
    this.isIssued,
    this.countLineItems,
    this.invoiceContact,
    this.invoiceCompany,
    this.billingAddress,
    this.serviceAddress,
    this.viewerUrl,
    this.exportPdf,
    this.policies,
    this.expiresOn,
    this.serviceName,
    this.params,
    this.createdAt,
    this.updatedAt,
  });

  Invoice copyWith({
    int? id,
    int? businessId,
    int? contactId,
    dynamic projectId,
    String? invoiceNo,
    String? invoiceType,
    int? addressId,
    int? regionId,
    int? billingAddressId,
    dynamic origin,
    dynamic refCode,
    String? owner,
    dynamic description,
    int? serviceId,
    String? currency,
    dynamic issuedOn,
    DateTime? dueDate,
    String? dueOn,
    dynamic subTotalCost,
    dynamic subTotalTaxableCost,
    dynamic totalCost,
    dynamic grandTotalCost,
    dynamic applyDiscount,
    dynamic applyTax,
    String? cancellationFee,
    dynamic amountDue,
    dynamic amountPaid,
    String? status,
    String? locked,
    dynamic paid,
    String? uniqid,
    Details? details,
    bool? isWorkorderInvoice,
    bool? isIssued,
    int? countLineItems,
    InvoiceContact? invoiceContact,
    InvoiceCompany? invoiceCompany,
    Address? billingAddress,
    Address? serviceAddress,
    String? viewerUrl,
    String? exportPdf,
    dynamic policies,
    dynamic expiresOn,
    String? serviceName,
    Params? params,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      Invoice(
        id: id ?? this.id,
        businessId: businessId ?? this.businessId,
        contactId: contactId ?? this.contactId,
        projectId: projectId ?? this.projectId,
        invoiceNo: invoiceNo ?? this.invoiceNo,
        invoiceType: invoiceType ?? this.invoiceType,
        addressId: addressId ?? this.addressId,
        regionId: regionId ?? this.regionId,
        billingAddressId: billingAddressId ?? this.billingAddressId,
        origin: origin ?? this.origin,
        refCode: refCode ?? this.refCode,
        owner: owner ?? this.owner,
        description: description ?? this.description,
        serviceId: serviceId ?? this.serviceId,
        currency: currency ?? this.currency,
        issuedOn: issuedOn ?? this.issuedOn,
        dueDate: dueDate ?? this.dueDate,
        dueOn: dueOn ?? this.dueOn,
        subTotalCost: subTotalCost ?? this.subTotalCost,
        subTotalTaxableCost: subTotalTaxableCost ?? this.subTotalTaxableCost,
        totalCost: totalCost ?? this.totalCost,
        grandTotalCost: grandTotalCost ?? this.grandTotalCost,
        applyDiscount: applyDiscount ?? this.applyDiscount,
        applyTax: applyTax ?? this.applyTax,
        cancellationFee: cancellationFee ?? this.cancellationFee,
        amountDue: amountDue ?? this.amountDue,
        amountPaid: amountPaid ?? this.amountPaid,
        status: status ?? this.status,
        locked: locked ?? this.locked,
        paid: paid ?? this.paid,
        uniqid: uniqid ?? this.uniqid,
        details: details ?? this.details,
        isWorkorderInvoice: isWorkorderInvoice ?? this.isWorkorderInvoice,
        isIssued: isIssued ?? this.isIssued,
        countLineItems: countLineItems ?? this.countLineItems,
        invoiceContact: invoiceContact ?? this.invoiceContact,
        invoiceCompany: invoiceCompany ?? this.invoiceCompany,
        billingAddress: billingAddress ?? this.billingAddress,
        serviceAddress: serviceAddress ?? this.serviceAddress,
        viewerUrl: viewerUrl ?? this.viewerUrl,
        exportPdf: exportPdf ?? this.exportPdf,
        policies: policies ?? this.policies,
        expiresOn: expiresOn ?? this.expiresOn,
        serviceName: serviceName ?? this.serviceName,
        params: params ?? this.params,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory Invoice.fromJson(Map<String, dynamic> json) => Invoice(
        id: json["id"],
        businessId: json["business_id"],
        contactId: json["contact_id"],
        projectId: json["project_id"],
        invoiceNo: json["invoice_no"],
        invoiceType: json["invoice_type"],
        addressId: json["address_id"],
        regionId: json["region_id"],
        billingAddressId: json["billing_address_id"],
        origin: json["origin"],
        refCode: json["ref_code"],
        owner: json["owner"],
        description: json["description"],
        serviceId: json["service_id"],
        currency: json["currency"],
        issuedOn: json["issued_on"],
        dueDate: json["due_date"] == null ? null : DateTime.parse(json["due_date"]),
        dueOn: json["due_on"],
        subTotalCost: json["sub_total_cost"],
        subTotalTaxableCost: json["sub_total_taxable_cost"],
        totalCost: json["total_cost"],
        grandTotalCost: json["grand_total_cost"],
        applyDiscount: json["apply_discount"],
        applyTax: json["apply_tax"],
        cancellationFee: json["cancellation_fee"],
        amountDue: json["amount_due"],
        amountPaid: json["amount_paid"],
        status: json["status"],
        locked: json["locked"],
        paid: json["paid"],
        uniqid: json["uniqid"],
        details: json["details"] == null ? null : Details.fromJson(json["details"]),
        isWorkorderInvoice: json["is_workorder_invoice"],
        isIssued: json["is_issued"],
        countLineItems: json["count_line_items"],
        invoiceContact: json["invoice_contact"] == null ? null : InvoiceContact.fromJson(json["invoice_contact"]),
        invoiceCompany: json["invoice_company"] == null ? null : InvoiceCompany.fromJson(json["invoice_company"]),
        billingAddress: json["billing_address"] == null ? null : Address.fromJson(json["billing_address"]),
        serviceAddress: json["service_address"] == null ? null : Address.fromJson(json["service_address"]),
        viewerUrl: json["viewer_url"],
        exportPdf: json["export_pdf"],
        policies: json["policies"],
        expiresOn: json["expires_on"],
        serviceName: json["service_name"],
        params: json["params"] == null ? null : Params.fromJson(json["params"]),
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "business_id": businessId,
        "contact_id": contactId,
        "project_id": projectId,
        "invoice_no": invoiceNo,
        "invoice_type": invoiceType,
        "address_id": addressId,
        "region_id": regionId,
        "billing_address_id": billingAddressId,
        "origin": origin,
        "ref_code": refCode,
        "owner": owner,
        "description": description,
        "service_id": serviceId,
        "currency": currency,
        "issued_on": issuedOn,
        "due_date": "${dueDate!.year.toString().padLeft(4, '0')}-${dueDate!.month.toString().padLeft(2, '0')}-${dueDate!.day.toString().padLeft(2, '0')}",
        "due_on": dueOn,
        "sub_total_cost": subTotalCost,
        "sub_total_taxable_cost": subTotalTaxableCost,
        "total_cost": totalCost,
        "grand_total_cost": grandTotalCost,
        "apply_discount": applyDiscount,
        "apply_tax": applyTax,
        "cancellation_fee": cancellationFee,
        "amount_due": amountDue,
        "amount_paid": amountPaid,
        "status": status,
        "locked": locked,
        "paid": paid,
        "uniqid": uniqid,
        "details": details?.toJson(),
        "is_workorder_invoice": isWorkorderInvoice,
        "is_issued": isIssued,
        "count_line_items": countLineItems,
        "invoice_contact": invoiceContact?.toJson(),
        "invoice_company": invoiceCompany?.toJson(),
        "billing_address": billingAddress?.toJson(),
        "service_address": serviceAddress?.toJson(),
        "viewer_url": viewerUrl,
        "export_pdf": exportPdf,
        "policies": policies,
        "expires_on": expiresOn,
        "service_name": serviceName,
        "params": params?.toJson(),
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
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

class Details {
  final int? taxExempt;
  final int? standalone;
  final dynamic issuedAt;
  final String? minPartialPayment;
  final String? offerExpiresIn;
  final dynamic notes;
  final dynamic disclaimer;
  final dynamic statementMemo;
  final dynamic thankingMessage;
  final dynamic discounted;
  final dynamic discountedInline;
  final dynamic taxAmount;
  final dynamic taxPercent;
  final dynamic cancellationTotal;
  final dynamic requiredAmount;
  final dynamic paymentMethod;
  final dynamic stripeCustomerId;
  final dynamic agreeTos;

  Details({
    this.taxExempt,
    this.standalone,
    this.issuedAt,
    this.minPartialPayment,
    this.offerExpiresIn,
    this.notes,
    this.disclaimer,
    this.statementMemo,
    this.thankingMessage,
    this.discounted,
    this.discountedInline,
    this.taxAmount,
    this.taxPercent,
    this.cancellationTotal,
    this.requiredAmount,
    this.paymentMethod,
    this.stripeCustomerId,
    this.agreeTos,
  });

  Details copyWith({
    int? taxExempt,
    int? standalone,
    dynamic issuedAt,
    String? minPartialPayment,
    String? offerExpiresIn,
    dynamic notes,
    dynamic disclaimer,
    dynamic statementMemo,
    dynamic thankingMessage,
    dynamic discounted,
    dynamic discountedInline,
    dynamic taxAmount,
    dynamic taxPercent,
    dynamic cancellationTotal,
    dynamic requiredAmount,
    dynamic paymentMethod,
    dynamic stripeCustomerId,
    dynamic agreeTos,
  }) =>
      Details(
        taxExempt: taxExempt ?? this.taxExempt,
        standalone: standalone ?? this.standalone,
        issuedAt: issuedAt ?? this.issuedAt,
        minPartialPayment: minPartialPayment ?? this.minPartialPayment,
        offerExpiresIn: offerExpiresIn ?? this.offerExpiresIn,
        notes: notes ?? this.notes,
        disclaimer: disclaimer ?? this.disclaimer,
        statementMemo: statementMemo ?? this.statementMemo,
        thankingMessage: thankingMessage ?? this.thankingMessage,
        discounted: discounted ?? this.discounted,
        discountedInline: discountedInline ?? this.discountedInline,
        taxAmount: taxAmount ?? this.taxAmount,
        taxPercent: taxPercent ?? this.taxPercent,
        cancellationTotal: cancellationTotal ?? this.cancellationTotal,
        requiredAmount: requiredAmount ?? this.requiredAmount,
        paymentMethod: paymentMethod ?? this.paymentMethod,
        stripeCustomerId: stripeCustomerId ?? this.stripeCustomerId,
        agreeTos: agreeTos ?? this.agreeTos,
      );

  factory Details.fromJson(Map<String, dynamic> json) => Details(
        taxExempt: json["tax_exempt"],
        standalone: json["standalone"],
        issuedAt: json["issued_at"],
        minPartialPayment: json["min_partial_payment"],
        offerExpiresIn: json["offer_expires_in"],
        notes: json["notes"],
        disclaimer: json["disclaimer"],
        statementMemo: json["statement_memo"],
        thankingMessage: json["thanking_message"],
        discounted: json["discounted"],
        discountedInline: json["discounted_inline"],
        taxAmount: json["tax_amount"],
        taxPercent: json["tax_percent"],
        cancellationTotal: json["cancellation_total"],
        requiredAmount: json["required_amount"],
        paymentMethod: json["payment_method"],
        stripeCustomerId: json["stripe_customer_id"],
        agreeTos: json["agree_tos"],
      );

  Map<String, dynamic> toJson() => {
        "tax_exempt": taxExempt,
        "standalone": standalone,
        "issued_at": issuedAt,
        "min_partial_payment": minPartialPayment,
        "offer_expires_in": offerExpiresIn,
        "notes": notes,
        "disclaimer": disclaimer,
        "statement_memo": statementMemo,
        "thanking_message": thankingMessage,
        "discounted": discounted,
        "discounted_inline": discountedInline,
        "tax_amount": taxAmount,
        "tax_percent": taxPercent,
        "cancellation_total": cancellationTotal,
        "required_amount": requiredAmount,
        "payment_method": paymentMethod,
        "stripe_customer_id": stripeCustomerId,
        "agree_tos": agreeTos,
      };
}

class InvoiceCompany {
  final String? name;
  final String? addressLine1;
  final String? addressLine2;
  final String? city;
  final String? state;
  final String? postcode;
  final String? country;
  final dynamic mobile;
  final String? email;
  final dynamic web;
  final String? photoUrl;

  InvoiceCompany({
    this.name,
    this.addressLine1,
    this.addressLine2,
    this.city,
    this.state,
    this.postcode,
    this.country,
    this.mobile,
    this.email,
    this.web,
    this.photoUrl,
  });

  InvoiceCompany copyWith({
    String? name,
    String? addressLine1,
    String? addressLine2,
    String? city,
    String? state,
    String? postcode,
    String? country,
    dynamic mobile,
    String? email,
    dynamic web,
    String? photoUrl,
  }) =>
      InvoiceCompany(
        name: name ?? this.name,
        addressLine1: addressLine1 ?? this.addressLine1,
        addressLine2: addressLine2 ?? this.addressLine2,
        city: city ?? this.city,
        state: state ?? this.state,
        postcode: postcode ?? this.postcode,
        country: country ?? this.country,
        mobile: mobile ?? this.mobile,
        email: email ?? this.email,
        web: web ?? this.web,
        photoUrl: photoUrl ?? this.photoUrl,
      );

  factory InvoiceCompany.fromJson(Map<String, dynamic> json) => InvoiceCompany(
        name: json["name"],
        addressLine1: json["address_line1"],
        addressLine2: json["address_line2"],
        city: json["city"],
        state: json["state"],
        postcode: json["postcode"],
        country: json["country"],
        mobile: json["mobile"],
        email: json["email"],
        web: json["web"],
        photoUrl: json["photo_url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "address_line1": addressLine1,
        "address_line2": addressLine2,
        "city": city,
        "state": state,
        "postcode": postcode,
        "country": country,
        "mobile": mobile,
        "email": email,
        "web": web,
        "photo_url": photoUrl,
      };
}

class InvoiceContact {
  final String? name;
  final dynamic company;
  final String? email;
  final String? mobile;
  final String? ref;
  final int? qbid;

  InvoiceContact({
    this.name,
    this.company,
    this.email,
    this.mobile,
    this.ref,
    this.qbid,
  });

  InvoiceContact copyWith({
    String? name,
    dynamic company,
    String? email,
    String? mobile,
    String? ref,
    int? qbid,
  }) =>
      InvoiceContact(
        name: name ?? this.name,
        company: company ?? this.company,
        email: email ?? this.email,
        mobile: mobile ?? this.mobile,
        ref: ref ?? this.ref,
        qbid: qbid ?? this.qbid,
      );

  factory InvoiceContact.fromJson(Map<String, dynamic> json) => InvoiceContact(
        name: json["name"],
        company: json["company"],
        email: json["email"],
        mobile: json["mobile"],
        ref: json["ref"],
        qbid: json["qbid"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "company": company,
        "email": email,
        "mobile": mobile,
        "ref": ref,
        "qbid": qbid,
      };
}

class Params {
  final int? workorderId;
  final String? workorderNo;
  final String? contactRef;
  final int? createdBy;
  final String? lockOnIssue;
  final dynamic issueAsActive;

  Params({
    this.workorderId,
    this.workorderNo,
    this.contactRef,
    this.createdBy,
    this.lockOnIssue,
    this.issueAsActive,
  });

  Params copyWith({
    int? workorderId,
    String? workorderNo,
    String? contactRef,
    int? createdBy,
    String? lockOnIssue,
    dynamic issueAsActive,
  }) =>
      Params(
        workorderId: workorderId ?? this.workorderId,
        workorderNo: workorderNo ?? this.workorderNo,
        contactRef: contactRef ?? this.contactRef,
        createdBy: createdBy ?? this.createdBy,
        lockOnIssue: lockOnIssue ?? this.lockOnIssue,
        issueAsActive: issueAsActive ?? this.issueAsActive,
      );

  factory Params.fromJson(Map<String, dynamic> json) => Params(
        workorderId: json["workorder_id"],
        workorderNo: json["workorder_no"],
        contactRef: json["contact_ref"],
        createdBy: json["created_by"],
        lockOnIssue: json["lock_on_issue"],
        issueAsActive: json["issue_as_active"],
      );

  Map<String, dynamic> toJson() => {
        "workorder_id": workorderId,
        "workorder_no": workorderNo,
        "contact_ref": contactRef,
        "created_by": createdBy,
        "lock_on_issue": lockOnIssue,
        "issue_as_active": issueAsActive,
      };
}
