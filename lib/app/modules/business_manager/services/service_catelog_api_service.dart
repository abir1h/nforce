import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/business_manager/models/service_catelog_model.dart';
import 'package:nuforce/app/modules/new_orders/models/activity_log_model.dart';
import '../../../utils/api_client.dart';
import '../../../utils/app_states.dart';
import '../../../utils/url.dart';
import '../../line_item/models/control.dart';
import 'dart:developer' as developer show log;

class ServiceCatelogsApiService {
  static Future<Either<ServiceCategoryDataModel, String>>
      getServiceCategories() async {
    try {
      final response =
          await ApiClient.instance.post(url: URL.getCategry, body: {
        "table": "category",
        "where": {},
        "order": "name ASC",
        "page": 1,
        "limit": 25,
        "columns": true
      });
      if (response.statusCode == 200 && response.data['data'] != null) {
        return Left(ServiceCategoryDataModel.fromJson(response.data));
      } else {
        return Right(response.data['error'] ?? 'An error occurred.');
      }
    } catch (e) {
      return Right(e.toString());
    }
  }

  static Future<Either<List<Control>, String>> getCategoryForm() async {
    try {
      final response = await ApiClient.instance.post(url: URL.getCategoryForm);
      if (response.statusCode == 200 && response.data != null) {
        developer.log('Response: $response', name: 'getCategoryForm');
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
        developer.log('Response: $response', name: 'getCategoryForm.else');
        return Right(response.data['error'] ?? 'An error occurred.');
      }
    } on DioException catch (e) {
      return Right(e.toString());
    } catch (e) {
      return Right(e.toString());
    }
  }

  static Future<Either<String, dynamic>> setCategoryForm({
    required int businessId,
    required String name,
    required String refCode,
    required String parentId,
    required String description,
    required String detailsGoogleTaxonomyId,
    required String displayOrder,
    required String policyIds,
    required List<String> tags,
  }) async {
    try {
      final body = {
        "data": {
          "business_id": businessId,
          "name": name,
          "ref_code": refCode,
          "parent_id": parentId,
          "description": description,
          "tags": tags.join('. '),
          "details.google_taxonomy_id": detailsGoogleTaxonomyId,
          "display_order": displayOrder,
          "policy_ids": policyIds,
        },
        "action": "submit"
      };

      developer.log('Body: $body', name: 'setNote');
      final response =
          await ApiClient.instance.post(url: URL.getCategoryForm, body: body);

      if (response.statusCode == 200 && response.data != null) {
        if (response.data['success'] != null) {
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
