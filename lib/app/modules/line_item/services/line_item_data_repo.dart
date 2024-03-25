import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:nuforce/app/modules/line_item/models/line_item_controller_model.dart';
import 'package:nuforce/app/modules/line_item/models/line_item_lookup_model.dart';
import 'package:nuforce/app/utils/api_client.dart';
import 'package:nuforce/app/utils/url.dart';

class LineItemRepository {
  Future<Either<LineItemControllerModel, String>> getLineItemControllerModel() async {
    try {
      final response = await ApiClient.instance.post(url: URL.lineItemFromInvoice);
      if (response.statusCode == 200) {
        return Left(LineItemControllerModel.fromJson(response.data));
      } else {
        return const Right('Something went wrong.');
      }
    } on DioException catch (e) {
      return Right(e.toString());
    } catch (e) {
      return Right(e.toString());
    }
  }

  Future<Either<List<LineItemLookupModel>, String>> lookupLineItem(String query) async {
    try {
      final response = await ApiClient.instance.get(url: URL.lookupLineItem.replaceAll('@', query));
      if (response.statusCode == 200) {
        final List<LineItemLookupModel> data = [];
        for (final item in response.data) {
          data.add(LineItemLookupModel.fromJson(item));
        }

        return Left(data);
      } else {
        return const Right('Something went wrong.');
      }
    } on DioException catch (e) {
      return Right(e.toString());
    } catch (e) {
      return Right(e.toString());
    }
  }
}
