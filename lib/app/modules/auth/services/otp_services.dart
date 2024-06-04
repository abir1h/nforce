import 'dart:developer';

import 'package:logger/logger.dart';
import 'package:nuforce/app/utils/api_client.dart';
import 'package:nuforce/app/utils/shared_preferences.dart';
import 'package:nuforce/app/utils/url.dart';

class OtpServices {
  static Future<bool> verifyOtp({
    required String uniqueId,
    required String email,
    required String otp,
    String? pipeline,
  }) async {
    try {
      final body = {
        "data": {
          "uniqid": uniqueId,
          "identifier": email,
          "pipeline": pipeline ?? "email",
          "token": otp,
        }
      };
      final response = await ApiClient.instance.post(
        url: URL.verifyIdentity,
        body: body,
      );
      Logger().i(response.data);
      if (response.data?['data']?['success'] != false) {
        final token = getTokenDataAsString(response.data?['data']?['redirectTo']);
        SharedPreferenceService.setToken(token);
        log('Token: $token', name: 'token');
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  static Future<bool> resendOtp({
    required int userId,
  }) async {
    try {
      final body = {
        "query": {
          "user_id": userId,
        }
      };
      final response = await ApiClient.instance.post(
        url: URL.resendOtp,
        body: body,
      );
      Logger().i(response.data);
      if (response.data?['data'] != null) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}

String getTokenDataAsString(String url) {
  final uri = Uri.parse(url);
  final dataParam = uri.queryParameters['data'];
  // final decodedData = utf8.decode(base64.decode(dataParam!));
  return dataParam ?? '';
}
