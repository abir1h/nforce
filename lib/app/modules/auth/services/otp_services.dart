import 'package:logger/logger.dart';
import 'package:nuforce/app/utils/api_client.dart';
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
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
