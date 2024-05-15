class URL {
  static const String baseUrl = 'https://nuforce.pro/api';

  static const String signup = '$baseUrl/public/hello.signup';
  static const String login = '$baseUrl/action/person.login';
  static const String passwordReset = '$baseUrl/public/hello.requestPasswordReset';
  static const String getUserCard = '$baseUrl/action/person.usercard';

  static const String businessProfileForm = '$baseUrl/form/business.profile-form';
  static const String getBusinessManagerRoles = '$baseUrl/browser/role';
  static const String businessRoleForm = '$baseUrl/form/role.entry-form';

  // Line Item
  static const String lineItem = '$baseUrl/form/lineitem.register-form';
  static const String lineItemFromInvoice = '$baseUrl/form/invoice.add-lineitem-form';
  static const String lookupLineItem = '$baseUrl/action/lineitems.lookup_lineitem?query[term]=@';

  // Work Order
  static const String workOrderServiceRegion = '$baseUrl/action/services.regions';
  static const String workOrderServicePackage = '$baseUrl/action/services.packages';
  static const String contactLookup = '$baseUrl/action/contact.searchForContact?query[term]=@';
  static const String contactDetails = '$baseUrl/action/contact.getContactDetails';
  static const String createWorkOrder = '$baseUrl/action/invoice.launchEstimation';

  static const String contactForm = '$baseUrl/form/contact.quick-form';
  static const String noteForm = '$baseUrl/form/contact.detail.note-form';

  static const String staticMap = "http://maps.google.com/maps/api/staticmap?center=lat,lng&zoom=15&size=200x200&sensor=false&key=AIzaSyDinOI_yEHrib-KuJHs9JeLPl7vdf1YNhM";

  static const String getActivityLog = '$baseUrl/action/company.activityLog';

  static const String getpaymentOptions = '$baseUrl/action/company.getPaymentOptions';
}
