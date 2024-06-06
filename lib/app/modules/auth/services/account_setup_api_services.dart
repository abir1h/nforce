import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:nuforce/app/modules/line_item/models/control.dart';
import 'package:nuforce/app/utils/api_client.dart';
import 'package:nuforce/app/utils/url.dart';

class AccountSetupApiServices {
  static Future<Either<List<Control>, String>> getAccountSetupForm([int? id]) async {
    try {
      final response = await ApiClient.instance.post(url: URL.businessRegisterForm);
      if (response.statusCode == 200 && response.data != null) {
        if (response.data['controls'] != null) {
          List<Control> controls = [];
          for (final control in response.data['controls']) {
            controls.add(Control.fromJson(control));
          }
          return Left(controls);
        } else {
          return Right(response.data['error'] ?? 'An error occurred.');
        }
      } else {
        return Right(response.data['error'] ?? 'An error occurred.');
      }
    } on DioException catch (e) {
      return Right(e.toString());
    } catch (e) {
      return Right(e.toString());
    }
  }

  static Future<Either<String, String>> saveBusinessProfile({
    required int userId,
    required String countryCode,
    required String orgCode,
    required String name,
    required String businessType,
    required String logoUrl,
    String? profileTagline,
    String? profileAbout,
    String? address,
    String? profilePhone,
    String? profileEmail,
    String? profileSupport,
    String? profileWebsite,
    String? profileTwitter,
    String? profileFacebook,
  }) async {
    final body = {
      "data": {
        "user_id": userId,
        'country_code': countryCode,
        'name': name,
        'business_type': businessType,
        'org_code': orgCode,
        'profile.logo_url': logoUrl,
        'profileTagline': profileTagline,
        'profileAbout': profileAbout,
        // 'address': address,
        'profilePhone': profilePhone,
        'profileEmail': profileEmail,
        'profileSupport': profileSupport,
        'profileWebsite': profileWebsite,
        'profileTwitter': profileTwitter,
        'profileFacebook': profileFacebook,
      },
      "action": 'submit',
    };

    try {
      final response = await ApiClient.instance.post(
        url: URL.businessRegisterForm,
        body: body,
      );
      if (response.data != null && response.data?['error'] == false) {
        return const Left('Success');
      } else {
        return Right(response.data['error'] ?? 'An error occurred.');
      }
    } on DioException catch (e) {
      return Right(e.toString());
    } catch (e) {
      return Right(e.toString());
    }
  }
}
