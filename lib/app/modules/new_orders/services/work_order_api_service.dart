import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:nuforce/app/modules/new_orders/models/contact_details_model.dart';
import 'package:nuforce/app/modules/new_orders/models/work_order_contact_search_model.dart';
import 'package:nuforce/app/modules/new_orders/models/work_order_service_package_model.dart';
import 'package:nuforce/app/modules/new_orders/models/work_order_service_region_model.dart';
import 'package:nuforce/app/modules/new_orders/models/work_order_success_model.dart';
import 'package:nuforce/app/utils/api_client.dart';
import 'package:nuforce/app/utils/url.dart';

class WorkOrderApiService {
  static Future<Either<WorkOrderServiceRegionModel, String>> fetchServiceRegion() async {
    try {
      final response = await ApiClient.instance.post(url: URL.workOrderServiceRegion);
      if (response.statusCode == 200 && response.data != null) {
        return Left(WorkOrderServiceRegionModel.fromJson(response.data));
      } else {
        return Right(response.data['error'] ?? 'An error occurred.');
      }
    } on DioException catch (e) {
      return Right(e.toString());
    } catch (e) {
      return Right(e.toString());
    }
  }

  static Future<Either<WorkOrderServicePackageModel, String>> fetchServicePackages() async {
    try {
      final response = await ApiClient.instance.post(url: URL.workOrderServicePackage);
      if (response.statusCode == 200 && response.data != null) {
        return Left(WorkOrderServicePackageModel.fromJson(response.data));
      } else {
        return Right(response.data['error'] ?? 'An error occurred.');
      }
    } on DioException catch (e) {
      return Right(e.toString());
    } catch (e) {
      return Right(e.toString());
    }
  }

  static Future<Either<List<WorkOrderContactSearch>, String>> contactLookup(String query) async {
    try {
      final response = await ApiClient.instance.get(url: URL.contactLookup.replaceAll('@', query));

      if (response.statusCode == 200 && response.data != null) {
        final List<WorkOrderContactSearch> contacts = [];
        for (final contact in response.data) {
          contacts.add(WorkOrderContactSearch.fromJson(contact));
        }
        return Left(contacts);
      } else {
        return Right(response.data['error'] ?? 'An error occurred.');
      }
    } on DioException catch (e) {
      return Right(e.toString());
    } catch (e) {
      return Right(e.toString());
    }
  }

  static Future<Either<ContactDetails, String>> getContactDetails(String id) async {
    try {
      final response = await ApiClient.instance.get(
        url: URL.contactDetails,
        data: {
          "query": {
            "id": id,
          }
        },
      );

      if (response.statusCode == 200 && response.data != null) {
        return Left(ContactDetails.fromJson(response.data));
      } else {
        return Right(response.data['error'] ?? 'An error occurred.');
      }
    } on DioException catch (e) {
      return Right(e.toString());
    } catch (e) {
      return Right(e.toString());
    }
  }

  static Future<Either<WorkOrderSuccessModel, String>> createWorkOrder({
    required String contactId,
    required String billingAddressId,
    required String serviceId,
    required String regionId,
    String? taxExempt,
    String? standalone,
  }) async {
    try {
      final response = await ApiClient.instance.post(
        url: URL.createWorkOrder,
        body: {
          "data": {
            "contact_id": contactId,
            "billing_address_id": billingAddressId,
            "service_id": serviceId,
            "region_id": regionId,
            "details": {
              "tax_exempt": taxExempt ?? 0,
              "standalone": standalone ?? 0,
            }
          }
        },
      );

      log('Response: $response', name: 'createWorkOrder');
      if (response.statusCode == 200 && response.data != null) {
        return Left(WorkOrderSuccessModel.fromJson(response.data));
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
