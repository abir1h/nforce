import 'package:dartz/dartz.dart';
import 'package:nuforce/app/utils/api_client.dart';
import 'package:nuforce/app/utils/app_constants.dart';
import 'package:nuforce/app/utils/url.dart';

class ForgotPasswordApiServices {
  static Future<Either<String, String>> sendPasswordResetLink({
    required String email,
  }) async {
    try {
      final response = await ApiClient.instance.get(
        url: URL.passwordReset,
        data: {
          'data': {
            'email': email,
          },
        },
      );
      if (response.data['success'] != null) {
        return Left('${response.data['success'] ?? 'Success'}');
      } else if (response.data['error'] != null) {
        return Right('${response.data['error'] ?? AppConstants.unknownError}');
      } else {
        return const Right(AppConstants.unknownError);
      }
    } catch (e) {
      return const Right(AppConstants.unknownError);
    }
  }
}
