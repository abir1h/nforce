import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:nuforce/app/modules/business_manager/models/service_category_model.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/calendar/services/business_manager_calendar_api_services.dart';
import '../../../utils/api_client.dart';
import '../../../utils/url.dart';
import '../../line_item/models/control.dart';
import 'dart:developer' as developer show log;

class ServiceCategoryApiService {
  static Future<Either<ServiceCategoryDataModel, String>> getServiceCategories() async {
    try {
      final response = await ApiClient.instance.post(
        url: URL.getCategry,
        body: {
          "table": "category",
          "where": {},
          "page": 1,
          "limit": 100,
          "columns": true,
        },
      );
      if (response.statusCode == 200 && response.data['data'] != null) {
        return Left(ServiceCategoryDataModel.fromJson(response.data));
      } else {
        return Right(response.data['error'] ?? 'An error occurred.');
      }
    } catch (e) {
      return Right(e.toString());
    }
  }

  static Future<Either<List<Control>, String>> getCategoryForm([int? id]) async {
    try {
      final response = await ApiClient.instance.post(
        url: URL.getCategoryForm,
        body: id != null
            ? {
                "query": {
                  "id": id,
                },
              }
            : {},
      );
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
    int? id,
    required int businessId,
    required String name,
    required String refCode,
    required String parentId,
    required String description,
    required String detailsGoogleTaxonomyId,
    required String displayOrder,
    required String policyIds,
    required List<String> tags,
    required ActionType action,
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
          "policy_ids": [policyIds],
          'photo_url': ''
        },
        "action": action.name,
      };

      if (id != null) {
        body['query'] = {
          "id": id,
        };
      }

      developer.log('Body: $body', name: 'setCategory');
      final response = await ApiClient.instance.post(
        url: URL.getCategoryForm,
        body: body,
      );

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

  Future<bool> deleteCategory(int id) async {
    try {
      final response = await ApiClient.instance.post(
        url: URL.getCategoryForm,
        body: {
          "data": {
            "id": id,
          },
          "action": ActionType.delete.name,
        },
      );

      if (response.statusCode == 200 && response.data != null) {
        if (response.data['success'] != null && response.data['error'] == false) {
          return true;
        } else {
          return false;
        }
      } else {
        return false;
      }
    } on DioException catch (_) {
      return false;
    } catch (e) {
      return false;
    }
  }
}
