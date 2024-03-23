class URL {
  static const String baseUrl = 'https://nuforce.pro/api';

  static const String signup = '$baseUrl/public/hello.signup';
  static const String login = '$baseUrl/action/person.login';
  static const String passwordReset = '$baseUrl/public/hello.requestPasswordReset';
  static const String getUserCard = '$baseUrl/action/person.usercard';

  static const String businessProfileForm = '$baseUrl/form/business.profile-form';
  static const String getBusinessManagerRoles = '$baseUrl/browser/role';
  static const String businessRoleForm = '$baseUrl/form/role.entry-form';
}
