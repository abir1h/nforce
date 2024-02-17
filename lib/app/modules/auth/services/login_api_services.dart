import 'package:dartz/dartz.dart';
import 'package:nuforce/app/model/login_response.dart';
import 'package:nuforce/app/utils/api_client.dart';
import 'package:nuforce/app/utils/app_constants.dart';
import 'package:nuforce/app/utils/url.dart';

class LoginService {
  static Future<Either<LoginResponse, String>> businessLogin({
    required String email,
    required String password,
  }) async {
    try {
      final response = await ApiClient.instance.post(
        url: URL.login,
        body: {
          'data': {
            'identity': email,
            'password': password,
          },
        },
      );

      if (response.data['data'] != null) {
        return Left(LoginResponse.fromJson(response.data as Map<String, dynamic>));
      } else {
        return Right('${response.data['error'] ?? AppConstants.unknownError}');
      }
    } catch (e) {
      return const Right(AppConstants.unknownError);
    }
  }
}
