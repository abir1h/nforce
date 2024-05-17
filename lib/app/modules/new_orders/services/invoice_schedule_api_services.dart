import 'dart:developer' as developer show log;

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:nuforce/app/model/invoice_schedule_mode.dart';
import 'package:nuforce/app/utils/api_client.dart';
import 'package:nuforce/app/utils/url.dart';

class InvoiceScheduleApiServices {
  static Future<Either<InvoiceScheduleModel, String>> getEvents({
    required String workorderId,
  }) async {
    try {
      final body = {
        "query": {
          "workorder_id": 17, // workorderId,
        }
      };
      final response = await ApiClient.instance.post(
        url: URL.getInvoiceSchedules,
        body: body,
      );
      if (response.statusCode == 200 && response.data != null) {
        developer.log('Response: $response', name: 'getEvents');
        if (response.data['data'] != null) {
          return Left(InvoiceScheduleModel.fromJson(response.data));
        } else {
          return Right(response.data['error'] ?? 'An error occurred.');
        }
      } else {
        developer.log('Response: $response', name: 'getEvents.else');
        return Right(response.data['error'] ?? 'An error occurred.');
      }
    } on DioException catch (e) {
      return Right(e.toString());
    } catch (e) {
      return Right(e.toString());
    }
  }
}
