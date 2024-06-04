import 'dart:developer';

import 'package:dartz/dartz.dart';
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
            'ref_code': refCode ?? '',
            'password': password,
            'agreed_to_tnc': agreedToTnc ? '1' : '0',
          },
        },
      );

      String? uniqueId;
      for (final control in response.data?['controls']) {
        if (control['name'] == 'uniqid') {
          uniqueId = control['value'];
          break;
        }
      }
      if (response.data?['error'] == false) {
        if (uniqueId != null) {
          return Left(uniqueId);
        } else {
          return Right(uniqueId ?? AppConstants.unknownError); // TODO Remove uniqueId on SMTP fixed production
        }
      } else {
        log('should return error object');
        return Right(uniqueId ?? '${response.data?['error'] ?? AppConstants.unknownError}'); // TODO Remove uniqueId on SMTP fixed production
      }
    } catch (e) {
      log('should return error object from catch block');
      return const Right(AppConstants.unknownError);
    }
  }
}

class RegistrationSuccess {
  final String uniqueId;
  final String identifier;
  final String pipeLine;

  RegistrationSuccess({
    required this.uniqueId,
    required this.identifier,
    required this.pipeLine,
  });
}
