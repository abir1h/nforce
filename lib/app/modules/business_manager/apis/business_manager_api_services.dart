import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:nuforce/app/modules/business_manager/models/business_profile_form_model.dart';
import 'package:nuforce/app/utils/api_client.dart';
import 'package:nuforce/app/utils/global_states.dart';
import 'package:nuforce/app/utils/url.dart';
import 'dart:developer' as developer show log;

AppState appState = Get.find<AppState>();

class BusinessManagerApiServices {
  static Future<Either<OranizationProfileFormModel, String>> businessProfileForm([
    Map<String, dynamic>? body,
  ]) async {
    developer.log(body.toString(), name: 'testing');
    try {
      final response = await ApiClient.instance.post(
        url: URL.businessProfileForm,
        body: body ??
            {
              "query": {
                "org_code": appState.user?.orgCode ?? '',
              }
            },
      );
      if (response.statusCode == 200) {
        Logger().i('budget ${OranizationProfileFormModel.fromJson(response.data as Map<String, dynamic>)}');
        return Left(OranizationProfileFormModel.fromJson(response.data as Map<String, dynamic>));
      } else {
        return const Right('Error');
      }
    } catch (e) {
      return right(e.toString());
    }
  }
}
