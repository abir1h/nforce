import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nuforce/app/modules/business_manager/apis/business_manager_api_services.dart';
import 'package:nuforce/app/modules/business_manager/models/form_model.dart';
import 'package:nuforce/app/shared/functions/image_picker_func.dart';
import 'package:nuforce/app/utils/app_states.dart';
import 'package:nuforce/app/utils/shared_preferences.dart';

class OrganizationProfileController extends GetxController {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  void toggleLoading() {
    _isLoading = !_isLoading;
    update();
  }

  XFile? _image;
  XFile? get image => _image;

  FormModel? _businessProfileFormModel;
  FormModel? get businessProfileFormModel => _businessProfileFormModel;

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
    await BusinessManagerApiServices.businessProfileForm().then((value) {
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
        } else if (control.name == 'businessType' && control.editor == 'dropdown') {
          businessTypeLabel = control.label ?? 'Business Type';
          if (businessTypeList.isEmpty) {
            // control.options?.forEach((element) {
            //   businessTypeList.add(DropdownModel(label: element.label, value: element.value));
            // });
          }
          for (final type in businessTypeList) {
            if (control.value == type.value) {
              _selectedBusinessType = type;
              break;
            } else {
              _selectedBusinessType = null;
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
          facebookPageController.text = control.value ?? '';
        } else if (control.name == 'profileLogoUrl') {
          profileLogoUrl = control.value;
          try {
            Uint8List? imageBytes;
            Dio dio = Dio();
            dio
                .get(
              control.value ?? '',
              options: Options(
                responseType: ResponseType.bytes,
                headers: {
                  // 'content-type': 'application/json',
                  // 'Accept': 'application/json',
                  'Authorization': 'Bearer ${SharedPreferenceService.getToken() ?? ''}',
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
          showResetWarning = action.confirm == true;
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

  Future<Either<String, String>> submitForm({
    required String countryCode,
    required String orgCode,
    required String name,
    required String businessType,
    required String logoUrl,
  }) async {
    toggleLoading();
    try {
      // final Map<String, dynamic> body = {
      //   'action': 'submit',
      //   'query': {
      //     'org_code': appState.user?.orgCode ?? '',
      //   },
      //   'data': {},
      // };

      // _businessProfileFormModel?.controls?.forEach((control) {
      //   if (control.name == 'name') {
      //     body['data'][control.key!] = displayNameController.text;
      //   } else if (control.name == 'profileTagline') {
      //     body['data'][control.key!] = brandTaglineController.text;
      //   } else if (control.name == 'businessType' && control.editor == 'dropdown') {
      //     body['data'][control.key!] = _selectedBusinessType?.value;
      //   } else if (control.name == 'profileAbout') {
      //     body['data'][control.key!] = aboutYourBusinessController.text;
      //   } else if (control.name == 'address') {
      //     body['data'][control.key!] = officeAddressController.text;
      //   } else if (control.name == 'profilePhone') {
      //     body['data'][control.key!] = phoneController.text;
      //   } else if (control.name == 'profileEmail') {
      //     body['data'][control.key!] = emailController.text;
      //   } else if (control.name == 'profileSupport') {
      //     body['data'][control.key!] = supportController.text;
      //   } else if (control.name == 'profileWebsite') {
      //     body['data'][control.key!] = websiteController.text;
      //   } else if (control.name == 'profileTwitter') {
      //     body['data'][control.key!] = twitterHandleController.text;
      //   } else if (control.name == 'profileFacebook') {
      //     body['data'][control.key!] = facebookPageController.text;
      //   } else if (control.name == 'profileLogoUrl') {
      //     // TODO Upload image
      //   }
      // });
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
      toggleLoading();
      return const Left('Success');
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      toggleLoading();
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
