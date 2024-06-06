import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/auth/services/account_setup_api_services.dart';
import 'package:nuforce/app/modules/business_manager/models/form_model.dart';
import 'package:nuforce/app/shared/widgets/form_builder.dart';
import 'dart:developer' as developer show log;

import 'package:nuforce/app/utils/shared_preferences.dart';

class AccountSetupController extends GetxController {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool val) {
    _isLoading = val;
    update();
  }

  CustomFormBuilder _formBuilder = CustomFormBuilder();
  CustomFormBuilder get formBuilder => _formBuilder;

  void setFormBuilder(CustomFormBuilder value) {
    _formBuilder = value;
    update();
  }

  void updateOnChanged(String name, Option? value) {
    _formBuilder.dropdownValue[name] = value;
    update();
  }

  Future<void> setForm() async {
    isLoading = true;
    await AccountSetupApiServices.getAccountSetupForm().then((value) {
      value.fold(
        (controls) {
          setFormBuilder(getForm(controls: controls));
        },
        (error) {
          developer.log('Error: $error', name: 'AccountSetupController.setForm');
        },
      );
    });
    isLoading = false;
  }

  // saveBusinessProfile
  Future<bool> saveBusinessProfile({
    required String countryCode,
    required String name,
    required String businessType,
    required String orgCode,
    required String logoUrl,
    String? profileTagline,
    String? profileAbout,
    String? address,
    String? profilePhone,
    String? profileEmail,
    String? profileSupport,
    String? profileWebsite,
    String? profileTwitter,
    String? profileFacebook,
  }) async {
    String? message;
    final userId = SharedPreferenceService.getUserId();
    if (userId == null) {
      developer.log('User ID is null', name: 'AccountSetupController.saveBusinessProfile');
      Fluttertoast.showToast(msg: 'Something went wrong. Please try again.');
      return false;
    }
    isLoading = true;
    await AccountSetupApiServices.saveBusinessProfile(
      userId: userId,
      countryCode: countryCode,
      name: name,
      businessType: businessType,
      orgCode: orgCode,
      logoUrl: logoUrl,
      profileWebsite: profileWebsite,
    ).then((value) {
      value.fold(
        (l) {
          message = l;
        },
        (r) {
          Fluttertoast.showToast(msg: r);
        },
      );
    });
    isLoading = false;
    return message != null;
  }
}
