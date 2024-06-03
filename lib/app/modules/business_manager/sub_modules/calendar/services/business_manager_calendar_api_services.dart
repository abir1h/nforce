import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:nuforce/app/model/calendar_list_model.dart';
import 'package:nuforce/app/modules/line_item/models/control.dart';
import 'package:nuforce/app/utils/api_client.dart';
import 'package:nuforce/app/utils/url.dart';

class BusinessManagerCalendarApiServices {
  static Future<Either<CalendarList, String>> getCalendarList([int? page = 1]) async {
    try {
      final data = {
        "table": "calendar",
        "page": page,
        "limit": 100,
      };
      final response = await ApiClient.instance.post(
        url: URL.calendarList,
        body: data,
      );
      if (response.statusCode == 200 && response.data != null) {
        return Left(CalendarList.fromJson(response.data));
      } else {
        return Right(response.data['error'] ?? 'An error occurred.');
      }
    } on DioException catch (e) {
      return Right(e.toString());
    } catch (e) {
      return Right(e.toString());
    }
  }

  static Future<Either<List<Control>, String>> getCalendarForm([int? id]) async {
    try {
      final data = {
        "query": {"id": id}
      };
      final response = await ApiClient.instance.post(
        url: URL.calendarForm,
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
    required int businessId,
    required String owner,
    required String context,
    required String name,
    required String description,
    required String timezone,
    required String color,
    required ActionType action,
  }) async {
    final body = {
      "data": {
        "business_id": businessId,
        "owner": owner,
        "context": context,
        "access_policy": "",
        "status": "active",
        "name": name,
        "details.description": description,
        "timezone": timezone,
        "details.color": color,
      },
      "action": action.name,
    };
    if (id != null) {
      body['query'] = {
        "id": id,
      };
    }

    Logger().i('body: $body');

    try {
      final response = await ApiClient.instance.post(
        url: URL.calendarForm,
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

enum ActionType { submit, delete }
