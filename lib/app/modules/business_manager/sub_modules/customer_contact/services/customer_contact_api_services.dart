import 'package:dartz/dartz.dart';
import 'package:nuforce/app/model/customers.dart';
import 'package:nuforce/app/utils/api_client.dart';
import 'package:nuforce/app/utils/app_constants.dart';
import 'package:nuforce/app/utils/url.dart';

class CustomerContactApiServices {
  static Future<Either<Customers, String>> getCustomers([String? query]) async {
    final response = await ApiClient.instance.post(
      url: URL.customer,
      body: {
        "where": {
          "_search": query??"",
          "user_type": "customer",
        }
      },
    );

    if (response.data['data'] != null) {
      return Left(Customers.fromJson(response.data as Map<String, dynamic>));
    } else {
      return Right('${response.data?['error'] ?? AppConstants.unknownError}');
    }
  }
}
