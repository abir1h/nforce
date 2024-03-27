import 'dart:developer' as developer show log;
import 'package:dartz/dartz.dart';
import 'package:nuforce/app/model/user_card_model.dart';
import 'package:nuforce/app/utils/api_client.dart';
import 'package:nuforce/app/utils/app_constants.dart';
import 'package:nuforce/app/utils/url.dart';

class UserApiService {
  Future<Either<UserCard, String>> getUser({required int userId}) async {
    try {
      final response = await ApiClient.instance.post(
        url: URL.getUserCard,
        body: <String, dynamic>{
          'query': {
            'user_id': userId,
          },
        },
      );
      developer.log('Response: ${response.data}', name: 'logout-debug');
      if (response.data['id'] != null) {
        return Left(UserCard.fromJson(response.data as Map<String, dynamic>));
      } else {
        return Right('${response.data['error'] ?? AppConstants.unknownError}');
      }
    } catch (e) {
      return const Right(AppConstants.unknownError);
    }
  }
}
