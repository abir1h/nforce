import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nuforce/app/modules/business_manager/apis/business_manager_api_services.dart';
import 'package:nuforce/app/modules/business_manager/models/business_profile_form_model.dart';
import 'package:nuforce/app/shared/functions/image_picker_func.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrganizationProfileController extends GetxController {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  void toggleLoading() {
    _isLoading = !_isLoading;
    update();
  }

  XFile? _image;
  XFile? get image => _image;

  OranizationProfileFormModel? _businessProfileFormModel;
  OranizationProfileFormModel? get businessProfileFormModel => _businessProfileFormModel;

  String? businessTypeLabel;
  DropdownModel? _selectedBusinessType;
  DropdownModel? get selectedBusinessType => _selectedBusinessType;
  List<DropdownModel> businessTypeList = [];
  String? profileLogoUrl;

  String displayNameLabel = '';
  final TextEditingController displayNameController = TextEditingController();

  String brandTaglineLabel = '';
  final TextEditingController brandTaglineController = TextEditingController();

  String profileAboutLabel = '';
  final TextEditingController aboutYourBusinessController = TextEditingController();

  String officeAddressLabel = '';
  final TextEditingController officeAddressController = TextEditingController();

  String phoneLabel = '';
  final TextEditingController phoneController = TextEditingController();

  String emailLabel = '';
  final TextEditingController emailController = TextEditingController();

  String supportLabel = '';
  final TextEditingController supportController = TextEditingController();

  String websiteLabel = '';
  final TextEditingController websiteController = TextEditingController();

  String twitterHandleLabel = '';
  final TextEditingController twitterHandleController = TextEditingController();

  String facebookPageLabel = '';
  final TextEditingController facebookPageController = TextEditingController();

  String submitButtonLabel = '';
  String resetButtonLabel = '';

  String resetWarning = '';
  bool showResetWarning = false;

  void onBusinessTypeChange(DropdownModel? value) {
    _selectedBusinessType = value;
    update();
  }

  Future<void> setImage() async {
    _image = await pickImage(ImageSource.gallery);
    update();
  }

  Future<void> removeImage() async {
    _image = null;
    update();
  }

  Future<void> getData() async {
    _isLoading = true;
    update();
    await BusinessManagerApiServices.getBusinessProfileForm().then((value) {
      value.fold(
        (l) {
          _businessProfileFormModel = l;
          update();
        },
        (r) {},
      );
    });
    setData();
    _isLoading = false;
    update();
  }

  void setData() {
    try {
      _businessProfileFormModel?.controls?.forEach((control) {
        if (control.name == 'name') {
          displayNameLabel = control.label ?? 'Display name';
          displayNameController.text = control.value ?? '';
        } else if (control.name == 'profileTagline') {
          brandTaglineLabel = control.label ?? 'Brand Tagline';
          brandTaglineController.text = control.value ?? '';
        } else if (control.name == 'businessType' && control.editor == Editor.DROPDOWN) {
          businessTypeLabel = control.label ?? 'Business Type';
          control.options?.forEach((element) {
            businessTypeList.add(DropdownModel(label: element.label, value: element.value));
          });
          for (final type in businessTypeList) {
            if (control.value == type.value) {
              _selectedBusinessType = type;
              break;
            }
          }
        } else if (control.name == 'profileAbout') {
          profileAboutLabel = control.label ?? 'About your business';
          aboutYourBusinessController.text = control.value ?? '';
        } else if (control.name == 'address') {
          officeAddressLabel = control.label ?? 'Office Address';
          officeAddressController.text = control.value ?? '';
        } else if (control.name == 'profilePhone') {
          phoneLabel = control.label ?? 'Phone';
          phoneController.text = control.value ?? '';
        } else if (control.name == 'profileEmail') {
          emailLabel = control.label ?? 'Email';
          emailController.text = control.value ?? '';
        } else if (control.name == 'profileSupport') {
          supportLabel = control.label ?? 'Support';
          supportController.text = control.value ?? '';
        } else if (control.name == 'profileWebsite') {
          websiteLabel = control.label ?? 'Website';
          websiteController.text = control.value ?? '';
        } else if (control.name == 'profileTwitter') {
          twitterHandleLabel = control.label ?? 'Twitter Handle';
          twitterHandleController.text = control.value ?? '';
        } else if (control.name == 'profileFacebook') {
          facebookPageLabel = control.label ?? 'Facebook Page';
        } else if (control.name == 'profileLogoUrl') {
          profileLogoUrl = control.value;
          // _image?.path = control.value ?? '';
          // Download image from url and set to _image
          // _image = XFile(control.value ?? '');
          try {
            final pref = Get.find<SharedPreferences>();
            Uint8List? imageBytes;
            Dio dio = Dio();
            dio
                .get(
              control.value ?? '',
              options: Options(
                responseType: ResponseType.bytes,
                headers: {
                  'content-type': 'application/json',
                  'Accept': 'application/json',
                  'Authorization': 'Bearer ${pref.getString("token")}',
                },
              ),
            )
                .then((value) async {
              if (value.statusCode == 200) {
                imageBytes = Uint8List.fromList(value.data);
                if (imageBytes != null) {
                  File tempFile = File('${Directory.systemTemp.path}/temp_image.jpg');
                  await tempFile.writeAsBytes(value.data);
                  _image = XFile(tempFile.path);
                  update();
                }
              }
            });
          } catch (e) {
            if (kDebugMode) {
              print(e);
            }
          }
        }
      });
      _businessProfileFormModel?.actions?.forEach((action) {
        if (action.action == 'submit') {
          submitButtonLabel = action.label ?? 'Submit';
        } else if (action.action == 'reset') {
          resetButtonLabel = action.label ?? 'Reset';
          showResetWarning = action.confirm ?? false;
          resetWarning = action.warning ?? 'Are you sure?';
        }
      });
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    update();
  }

  void resetForm() {
    if (_businessProfileFormModel != null) {
      setData();
    } else {
      profileLogoUrl = null;
      displayNameController.text = '';
      brandTaglineController.text = '';
      _selectedBusinessType = null;
      aboutYourBusinessController.text = '';
      officeAddressController.text = '';
      phoneController.text = '';
      emailController.text = '';
      supportController.text = '';
      websiteController.text = '';
      twitterHandleController.text = '';
      facebookPageController.text = '';
      update();
    }
  }

  // Future<Either<String, String>> submitForm() async {}
}

class DropdownModel {
  final String? label;
  final String? value;

  DropdownModel({
    this.label,
    this.value,
  });
}
