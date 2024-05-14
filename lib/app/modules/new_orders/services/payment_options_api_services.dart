import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:nuforce/app/model/company_payment_options.dart';
import 'package:nuforce/app/utils/api_client.dart';
import 'package:nuforce/app/utils/url.dart';

class PaymentOptionsApiService {
  static Future<Either<CompanyPaymentOptions, String>> getCompanyPaymentOptions({required int? businessId}) async {
    if (businessId == null) return const Right('Business ID is required.');

    try {
      final response = await ApiClient.instance.post(
        url: URL.getpaymentOptions,
        body: {
          "query": {
            "business_id": businessId,
          },
        },
      );
      if (response.statusCode == 200 && response.data != null) {
        return Left(CompanyPaymentOptions.fromJson(response.data));
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
