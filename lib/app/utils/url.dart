class URL {
  static const String baseUrl = 'https://hq.nuforce360.com/api';

  static const String signup = '$baseUrl/public/hello.signup';
  static const String login = '$baseUrl/action/person.login';
  static const String verifyIdentity = '/public/hello.verifyIdentity';
  static const String passwordReset = '$baseUrl/public/hello.requestPasswordReset';
  static const String getUserCard = '$baseUrl/action/person.usercard';

  static const String businessProfileForm = '$baseUrl/form/business.profile-form';
  static const String getRoles = '$baseUrl/browser/role';
  static const String roleForm = '$baseUrl/form/role.entry-form';
  static const String resendOtp = '/action/person.resendVerificationCode';

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
  static const String getInvoiceSchedules = '$baseUrl/action/workorder.events';
  static const String customer = '$baseUrl/action/contact.browse';

  // business manager
  static const String calendarList = '$baseUrl/browser/calendar';
  static const String calendarForm = '$baseUrl/form/calendar.register-form';

  ///Category
  static const String getCategry = '$baseUrl/browser/category';
  static const String getCategoryForm = '$baseUrl/form/category.register-form';

  // Labels
  static const String getLabels = '/browser/label';
  static const String labelForm = '/form/label.entry-form';

  // Contact Groups
  static const String getContactGroups = '/browser/group';
  static const String contactGroupForm = '/form/group.entry-form';

  // Commission Tiers
  static const String getCommissionTiers = '/browser/commission';
  static const String commissionTierForm = '/form/commission.entry-form';

  ///Service Topic
  static const String getTopics = '$baseUrl/browser/topic';
  static const String getTopicForm = '$baseUrl/form/topic.entry-form';

  ///Service Topic
  static const String getRegions = '$baseUrl/browser/region';
  static const String getRegionForm = '$baseUrl/form/region.entry-form';

  ///Service Topic
  static const String getTerms = '$baseUrl/browser/policy';
  static const String getTermsForm = '$baseUrl/form/policy.register-form';
}
