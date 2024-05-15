import 'dart:developer' as developer show log;

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:nuforce/app/modules/line_item/models/control.dart';
import 'package:nuforce/app/utils/api_client.dart';
import 'package:nuforce/app/utils/url.dart';

import '../models/contact_details_model.dart';

class NoteApiService {
  static Future<Either<List<Control>, String>> getNoteForm() async {
    try {
      final response = await ApiClient.instance.post(url: URL.noteForm);
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

  static Future<Either<String, dynamic>> setNote({
    required int contactId,
    required String detailValue,

  }) async {
    try {
      final body = {
        "data": {
          "contact_id": contactId,
          "detail_type": "note",
          "detail_value": detailValue
        },
        "action": "submit"
      };
      developer.log('Body: $body', name: 'setNote');
      final response = await ApiClient.instance.post(url: URL.noteForm, body: body);

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
  static Future<Either<SelectedContactDetails, String>> getNote(String id) async {
    try {
      final response = await ApiClient.instance.get(
        url: URL.contactDetails,
        data: {
          "query": {
            "id": id,
          }
        },
      );

      if (response.statusCode == 200 && response.data != null) {
        return Left(SelectedContactDetails.fromJson(response.data));
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
