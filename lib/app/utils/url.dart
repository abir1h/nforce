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
}
