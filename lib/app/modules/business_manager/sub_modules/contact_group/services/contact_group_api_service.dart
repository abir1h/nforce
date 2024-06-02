import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:nuforce/app/model/contact_group_model.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/calendar/services/business_manager_calendar_api_services.dart';
import 'package:nuforce/app/modules/line_item/models/control.dart';
import 'package:nuforce/app/utils/api_client.dart';
import 'package:nuforce/app/utils/app_states.dart';
import 'package:nuforce/app/utils/url.dart';

class ContactGroupApiServices {
  static Future<Either<ContactGroupModel, String>> getModelList([int? page = 1]) async {
    try {
      final data = {
        "table": "group",
        "page": page,
        "limit": 100,
      };
      final response = await ApiClient.instance.post(
        url: URL.getContactGroups,
        body: data,
      );
      if (response.statusCode == 200 && response.data != null) {
        return Left(ContactGroupModel.fromJson(response.data));
      } else {
        return Right(response.data['error'] ?? 'An error occurred.');
      }
    } on DioException catch (e) {
      return Right(e.toString());
    } catch (e) {
      return Right(e.toString());
    }
  }

  static Future<Either<List<Control>, String>> getCustomerGroupForm([int? id]) async {
    try {
      final data = {
        "query": {"id": id}
      };
      final response = await ApiClient.instance.post(
        url: URL.contactGroupForm,
        body: id != null ? data : null,
      );
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

  static Future<Either<String, String>> saveEditOrDelete({
    int? id,
    required String name,
    required String description,
    required ActionType action,
  }) async {
    final appState = Get.find<AppState>();
    final body = {
      "data": {
        "business_id": appState.user?.businessId,
        "group_type": "group",
        "group_code": "vendor",
        "active": 1,
        "parent_id": "",
        "name": name,
        "details.description": description,
      },
      "action": action.name,
    };
    log('ID: $id', name: 'testing');
    if (id != null) {
      body['query'] = {
        "id": id,
      };
    }

    Logger().i(body);

    try {
      final response = await ApiClient.instance.post(
        url: URL.contactGroupForm,
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
