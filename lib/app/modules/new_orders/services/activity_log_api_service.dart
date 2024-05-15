import 'package:dartz/dartz.dart';
import 'package:nuforce/app/modules/new_orders/models/activity_log_model.dart';

import '../../../model/business_manager/role_model.dart';
import '../../../utils/api_client.dart';
import '../../../utils/url.dart';

class ActivityLogApiService {
  static Future<Either<ActivityLogDataModel, String>> getActivityLog(int id) async {
    try {
      final response = await ApiClient.instance.post(
        url: URL.getActivityLog,
        body: {
          "where": {"owner": "invoice:$id"}
        },
      );
      if (response.statusCode == 200 && response.data['data'] != null) {
        return Left(ActivityLogDataModel.fromJson(response.data));
      } else {
        return Right(response.data['error'] ?? 'An error occurred.');
      }
    } catch (e) {
      return Right(e.toString());
    }
  }
}
