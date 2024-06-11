import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:nuforce/app/modules/business_manager/apis/business_manager_api_services.dart';
import 'package:nuforce/app/modules/business_manager/models/form_model.dart' as form_model;
import 'package:nuforce/app/shared/functions/image_picker_func.dart';
import 'package:nuforce/app/shared/widgets/form_builder.dart';
import 'package:nuforce/app/utils/app_states.dart';
import 'package:nuforce/app/utils/shared_preferences.dart';
import 'dart:developer' as developer show log;

class OrganizationProfileController extends GetxController {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    update();
  }

  XFile? _image;
  XFile? get image => _image;

  String? profileLogoUrl;

  String submitButtonLabel = '';
  String resetButtonLabel = '';

  String resetWarning = '';
  bool showResetWarning = false;

  Future<void> setImage() async {
    _image = await pickImage(ImageSource.gallery);
    update();
  }

  Future<void> removeImage() async {
    _image = null;
    update();
  }

  String? _profileImage;
  String? get profileImage => _profileImage;
  set profileImage(String? value) {
    _profileImage = value;
    update();
  }

  final companyNameController = TextEditingController();
  final phoneController = TextEditingController();
  final websiteController = TextEditingController();
  final orgCodeController = TextEditingController();

  List<form_model.Option> businessType = [
    form_model.Option(label: 'Self Employed', value: ''),
    form_model.Option(label: 'Team Work', value: 'team'),
    form_model.Option(label: 'Corporation', value: 'corporation'),
    form_model.Option(label: 'Proprietorship', value: 'proprietorship'),
    form_model.Option(label: 'Partnership', value: 'partnership'),
  ];
  form_model.Option? _selectedBusinessType;
  form_model.Option? get selectedBusinessType => _selectedBusinessType;
  set selectedBusinessType(form_model.Option? value) {
    _selectedBusinessType = value;
    update();
  }

  String _selectedCountry = 'US';
  String get selectedCountry => _selectedCountry;
  set selectedCountry(String value) {
    _selectedCountry = value;
    update();
  }

  CustomFormBuilder _formBuilder = CustomFormBuilder();
  CustomFormBuilder get formBuilder => _formBuilder;

  void setFormBuilder(CustomFormBuilder value) {
    _formBuilder = value;
    update();
  }

  void setControllers() {
    final appState = Get.find<AppState>();

    companyNameController.text = formBuilder.textEditingControllers['name']?.text ?? '';
    phoneController.text = formBuilder.textEditingControllers['profilePhone']?.text ?? '';
    websiteController.text = formBuilder.textEditingControllers['profileWebsite']?.text ?? '';
    orgCodeController.text = appState.user?.orgCode ?? '';
    final dropdown = formBuilder.dropdownValue['businessType'];
    for (final element in businessType) {
      if (element.value == dropdown?.value) {
        selectedBusinessType = element;
      }
    }
  }

  Future<void> getProfileForm([int? id]) async {
    isLoading = true;
    await BusinessManagerApiServices.businessProfileForm().then((value) {
      value.fold(
        (controls) {
          Logger().i(controls);
          setFormBuilder(getForm(controls: controls));
          setControllers();
        },
        (error) {
          developer.log('Error: $error', name: 'getProfileForm');
        },
      );
    });
    isLoading = false;
  }

  Future<Either<String, String>> submitForm({
    required String countryCode,
    required String orgCode,
    required String name,
    required String businessType,
    required String logoUrl,
  }) async {
    isLoading = true;
    try {
      final appState = Get.find<AppState>();
      final body = {
        "query": {
          "org_code": appState.user?.orgCode,
        },
        "data": {
          "user_id": SharedPreferenceService.getUserId(),
          'country_code': countryCode,
          'name': name,
          'business_type': businessType,
          'org_code': orgCode,
          'profile.logo_url': logoUrl,
        },
        "action": 'submit',
      };
      await BusinessManagerApiServices.businessProfileForm(body).then((value) {
        value.fold(
          (l) {
            return const Left('Success');
          },
          (r) {
            return Right(r);
          },
        );
      });
      isLoading = false;
      return const Left('Success');
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      isLoading = false;
      return const Right('Error');
    }
  }
}

class DropdownModel {
  final String? label;
  final String? value;

  DropdownModel({
    this.label,
    this.value,
  });
}
