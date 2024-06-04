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
  static Future<Either<RegistrationSuccess, String>> signup({
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
          log('${response.data?['query']?['id']}', name: 'userid');
          return Left(RegistrationSuccess(
            uniqueId: uniqueId,
            identifier: email,
            userId: response.data?['query']?['id'] ?? 0,
          ));
        } else {
          return const Right(AppConstants.unknownError);
        }
      } else {
        log('should return error object');
        return Right('${response.data?['error'] ?? AppConstants.unknownError}');
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
  final int userId;

  RegistrationSuccess({
    required this.uniqueId,
    required this.identifier,
    required this.userId,
  });
}
