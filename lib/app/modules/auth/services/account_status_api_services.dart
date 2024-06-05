import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:nuforce/app/model/account_status.dart';
import 'package:nuforce/app/utils/api_client.dart';
import 'package:nuforce/app/utils/app_constants.dart';
import 'package:nuforce/app/utils/url.dart';

class AccountStatusApiServices {
  static Future<Either<AccountStatus, String>> getAccountStatus({required String uniqueId}) async {
    try {
      final response = await ApiClient.instance.get(
        url: URL.accountStatus,
        data: {
          "query": {"uniqid": uniqueId}
        },
      );
      if (response.data != response && response.data?['data'] != null) {
        return Left(AccountStatus.fromJson(response.data));
      } else {
        return Right(response.data?['data']?['error'] ?? AppConstants.unknownError);
      }
    } on DioException catch (e) {
      return Right(e.response?.data['data']?['error'] ?? e.toString());
    } catch (e) {
      return const Right(AppConstants.unknownError);
    }
  }
}
