import 'package:dartz/dartz.dart';
import 'package:logger/logger.dart';
import 'package:nuforce/app/utils/api_client.dart';
import 'package:nuforce/app/utils/app_constants.dart';
import 'package:nuforce/app/utils/url.dart';

enum UserTypes {
  customer,
  user,
  provider,
}

class SignupService {
  static Future<Either<String, String>> signup({
    required UserTypes userType,
    required String countryCode,
    required String name,
    required String email,
    // required String phone,
    required String password,
    required bool agreedToTnc,
    String? refCode,
  }) async {
    try {
      final response = await ApiClient.instance.post(
        url: URL.signup,
        body: {
          'data': {
            'user_type': userType.name,
            'country_code': countryCode,
            'name': name,
            'email': email,
            // 'mobile': phone,
            'ref_code': refCode ?? '',
            'password': password,
            'agreed_to_tnc': agreedToTnc ? '1' : '0',
          },
        },
      );
      Logger().i(response.data);
      if (response.data['error'] == false) {
        return Left('${response.data['success'] ?? 'Success'}');
      } else {
        return Right('${response.data['error'] ?? AppConstants.unknownError}');
      }
    } catch (e) {
      return const Right(AppConstants.unknownError);
    }
  }
}
