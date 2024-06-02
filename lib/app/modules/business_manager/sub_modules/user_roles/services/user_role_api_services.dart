import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:nuforce/app/model/business_manager/role_model.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/calendar/services/business_manager_calendar_api_services.dart';
import 'package:nuforce/app/modules/line_item/models/control.dart';
import 'package:nuforce/app/utils/api_client.dart';
import 'package:nuforce/app/utils/app_states.dart';
import 'package:nuforce/app/utils/url.dart';

class UserRoleApiServices {
  static Future<Either<RoleModel, String>> getModelList([int? page = 1]) async {
    try {
      final response = await ApiClient.instance.post(url: URL.getRoles);
      if (response.statusCode == 200 && response.data != null) {
        return Left(RoleModel.fromJson(response.data));
      } else {
        return Right(response.data['error'] ?? 'An error occurred.');
      }
    } on DioException catch (e) {
      return Right(e.toString());
    } catch (e) {
      return Right(e.toString());
    }
  }

  static Future<Either<List<Control>, String>> getRoleForm([int? id]) async {
    try {
      final data = {
        "query": {"id": id}
      };
      final response = await ApiClient.instance.post(
        url: URL.roleForm,
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
    required ActionType action,
    required String name,
    required String subType,
    required String accessPolicy,
    required String description,
    required String accessModules,
  }) async {
    final appState = Get.find<AppState>();
    final body = {
      "data": {
        "business_id": appState.user?.businessId,
        "params.org_code": appState.user?.orgCode,
        "group_type": "role",
        "name": name,
        "sub_type": subType,
        "access_policy": accessPolicy,
        "details.description": description,
        "details.access_modules": accessModules,
        "active": 1, // TODO Add switch in form builder
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
      final response = await ApiClient.instance.post(url: URL.roleForm, body: body);
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
