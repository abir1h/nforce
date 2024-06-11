import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:nuforce/app/model/business_manager/role_model.dart';
import 'package:nuforce/app/modules/business_manager/models/form_model.dart';
import 'package:nuforce/app/modules/line_item/models/control.dart';
import 'package:nuforce/app/utils/api_client.dart';
import 'package:nuforce/app/utils/app_states.dart';
import 'package:nuforce/app/utils/url.dart';
import 'dart:developer' as developer show log;

AppState appState = Get.find<AppState>();

class BusinessManagerApiServices {
  static Future<Either<List<Control>, String>> businessProfileForm([
    Map<String, dynamic>? body,
  ]) async {
    developer.log(body.toString(), name: 'testing');
    try {
      final response = await ApiClient.instance.post(
        url: URL.businessProfileForm,
        body: body ??
            {
              "query": {
                "org_code": appState.user?.orgCode ?? '',
              }
            },
      );
      if (response.statusCode == 200) {
        Logger().i('budget ${FormModel.fromJson(response.data as Map<String, dynamic>)}');
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
        return const Right('Error');
      }
    } catch (e) {
      return right(e.toString());
    }
  }

  static Future<Either<RoleModel, String>> getRoles([int? page, int? limit]) async {
    try {
      final response = await ApiClient.instance.post(
        url: URL.getRoles,
        body: {
          "table": "role",
          "page": page ?? 1,
          "limit": limit ?? 10,
          "where": {},
          "order": "id asc",
          "transform": "",
          "humanized": true,
          "columns": false,
        },
      );
      if (response.statusCode == 200 && response.data['data'] != null) {
        return Left(RoleModel.fromJson(response.data));
      } else {
        return right('Error');
      }
    } catch (e) {
      return right(e.toString());
    }
  }

  static Future<Either<FormModel, String>> businessRoleForm({
    Map<String, dynamic>? body,
  }) async {
    try {
      final response = await ApiClient.instance.post(
        url: URL.roleForm,
        body: body,
      );
      if (response.statusCode == 200) {
        Logger().i('budget ${FormModel.fromJson(response.data as Map<String, dynamic>)}');
        return Left(FormModel.fromJson(response.data as Map<String, dynamic>));
      } else {
        Logger().i('budget ${FormModel.fromJson(response.data as Map<String, dynamic>)}');
        return const Right('Error');
      }
    } catch (e) {
      Logger().i('budget $e');
      return right(e.toString());
    }
  }
}
