import 'dart:developer' as developer show log;

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:nuforce/app/modules/line_item/models/control.dart';
import 'package:nuforce/app/utils/api_client.dart';
import 'package:nuforce/app/utils/url.dart';

class ContactApiServices {
  static Future<Either<List<Control>, String>> getContactForm() async {
    try {
      final response = await ApiClient.instance.post(url: URL.contactForm);
      if (response.statusCode == 200 && response.data != null) {
        developer.log('Response: $response', name: 'getContactForm');
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
        developer.log('Response: $response', name: 'getContactForm.else');
        return Right(response.data['error'] ?? 'An error occurred.');
      }
    } on DioException catch (e) {
      return Right(e.toString());
    } catch (e) {
      return Right(e.toString());
    }
  }

  static Future<Either<String, String>> setContact({
    required int businessId,
    required String owner,
    required String name,
    required String refCode,
    required String company,
    required List<String> tags,
    required String primaryEmail,
    required String primaryMobile,
    required String groupId,
  }) async {
    try {
      final body = {
        "data": {
          "business_id": businessId,
          "owner": owner,
          "name": name,
          "ref_code": refCode,
          "details.company": company,
          "tags": tags.join('. '),
          "details.primary_email": primaryEmail,
          "details.primary_mobile": primaryMobile,
          "group_id": groupId,
        },
        "action": "submit"
      };
      developer.log('Body: $body', name: 'setContact');
      final response = await ApiClient.instance.post(url: URL.contactForm, body: body);

      if (response.statusCode == 200 && response.data != null) {
        if (response.data['success'] != null) {
          return Left(response.data['success']);
        } else {
          return Right(response.data['error'] ?? 'An error occurred.');
        }
      } else {
        developer.log('Response: $response', name: 'setContact.else');
        return Right(response.data['error'] ?? 'An error occurred.');
      }
    } on DioException catch (e) {
      return Right(e.toString());
    } catch (e) {
      return Right(e.toString());
    }
  }
}
