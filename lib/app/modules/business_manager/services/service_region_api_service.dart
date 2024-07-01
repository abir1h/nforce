import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/business_manager/models/service_region_model.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/calendar/services/business_manager_calendar_api_services.dart';
import 'package:nuforce/app/utils/app_states.dart';
import '../../../utils/api_client.dart';
import '../../../utils/url.dart';
import '../../line_item/models/control.dart';
import 'dart:developer' as developer show log;

class ServiceRegionApiService {
/*  static Future<Either<ServiceRegionDataModel, String>> getServiceRegions() async {
    try {
      final response =
          await ApiClient.instance.post(url: URL.getRegions, body: {"table": "region", "page": 1, "limit": 20, "where": {}, "order": "id asc", "transform": "", "humanized": true, "columns": true});
      if (response.statusCode == 200 && response.data['data'] != null) {
        return Left(ServiceRegionDataModel.fromJson(response.data));
      } else {
        return Right(response.data['error'] ?? 'An error occurred.');
      }
    } catch (e) {
      return Right(e.toString());
    }
  }*/
  static Future<Either<ServiceRegionDataModel, String>> getServiceRegions({int page = 1}) async {
    try {
      final response = await ApiClient.instance.post(
        url: URL.getRegions,
        body: {
          "table": "region",
          "page": page,
          "limit": 10,
          "where": {},
          "order": "id asc",
          "transform": "",
          "humanized": true,
          "columns": true
        },
      );
      if (response.statusCode == 200 && response.data['data'] != null) {
        return Left(ServiceRegionDataModel.fromJson(response.data));
      } else {
        return Right(response.data['error'] ?? 'An error occurred.');
      }
    } catch (e) {
      return Right(e.toString());
    }
  }

  static Future<Either<List<Control>, String>> getRegionForm([int? id]) async {
    try {
      final data = {
        "query": {"id": id}
      };
      final response = await ApiClient.instance.post(
        url: URL.getRegionForm,
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

  static Future<Either<String, dynamic>> setRegionForm({
    int? id,
    required int businessId,
    required String name,
    required String subType,
    required String groupCode,
    required String detailsPrefixCode,
    required ActionType action,
  }) async {
    try {
      final controller = Get.find<AppState>();
      final body = {
        "data": {
          "business_id": controller.user?.businessId,
          "params.org_code": controller.user?.orgCode,
          "group_type": "region",
          "parent_id": null,
          "details.description": null,
          "name": name,
          "sub_type": subType,
          "group_code": groupCode,
          "details.prefix_code": detailsPrefixCode,
          "active": 1
        },
        "action": action.name,
      };
      if (id != null) {
        body['query'] = {
          "id": id,
        };
      }
      developer.log('Body: $body', name: 'setCategory');
      final response = await ApiClient.instance.post(url: URL.getRegionForm, body: body);

      if (response.statusCode == 200 && response.data != null) {
        if (response.data['success'] != null && response.data['error'] == false) {
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
