import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:nuforce/app/modules/business_manager/models/service_topic_model.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/calendar/services/business_manager_calendar_api_services.dart';
import '../../../utils/api_client.dart';
import '../../../utils/url.dart';
import '../../line_item/models/control.dart';
import 'dart:developer' as developer show log;

class ServiceTopicApiService {
  static Future<Either<ServiceTopicDataModel, String>> getServiceTopics() async {
    try {
      final response =
          await ApiClient.instance.post(url: URL.getTopics, body: {"table": "topic", "page": 1, "limit": 100, "where": {}, "order": "id asc", "transform": "", "humanized": true, "columns": true});
      if (response.statusCode == 200 && response.data['data'] != null) {
        return Left(ServiceTopicDataModel.fromJson(response.data));
      } else {
        return Right(response.data['error'] ?? 'An error occurred.');
      }
    } catch (e) {
      return Right(e.toString());
    }
  }

  static Future<Either<List<Control>, String>> getTopicForm([int? id]) async {
    try {
      final data = {
        "query": {"id": id}
      };
      final response = await ApiClient.instance.post(
        url: URL.getTopicForm,
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

  static Future<Either<String, dynamic>> setTopicForm({
    int? id,
    required int businessId,
    required String name,
    required String groupCode,
    required String detailsDescription,
    required ActionType action,
  }) async {
    try {
      final body = {
        "data": {
          "business_id": businessId,
          "group_type": "topic",
          "active": 1,
          "name": name,
          "group_code": groupCode,
          "details.description": detailsDescription,
        },
        "action": action.name,
      };
      if (id != null) {
        body['query'] = {
          "id": id,
        };
      }
      developer.log('Body: $body', name: 'setCategory');
      final response = await ApiClient.instance.post(url: URL.getTopicForm, body: body);

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
