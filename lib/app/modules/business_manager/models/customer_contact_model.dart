
class CustomerContactModel {
  int? customerContactId;
  String? name;
  String? refCode;
  String? companyName;
  String? tags;
  String? email;
  String? mobile;
  String? folderName;

  CustomerContactModel({
    this.name,
    this.customerContactId,
    this.refCode,
    this.companyName,
    this.tags,
    this.email,
    this.mobile,
    this.folderName,
  });
}