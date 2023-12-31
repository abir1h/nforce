import 'package:dartz/dartz.dart';
import 'package:nuforce/app/model/user_model.dart';
import 'package:nuforce/app/utils/api_client.dart';
import 'package:nuforce/app/utils/app_constants.dart';
import 'package:nuforce/app/utils/url.dart';

class LoginService {
  static Future<Either<User, String>> businessLogin({
    required String email,
    required String password,
  }) async {
    try {
      final response = await ApiClient.instance.post(
        url: Url.businessLogin,
        body: {
          "data": {
            "identity": email,
            "password": password,
          }
        },
      );

      if (response != null && response.data['data'] != null) {
        return Left(User.fromJson(response.data));
      } else {
        return Right(response.data['error'] ?? AppConstants.unknownError);
      }
    } catch (e) {
      return const Right(AppConstants.unknownError);
    }
  }
}
