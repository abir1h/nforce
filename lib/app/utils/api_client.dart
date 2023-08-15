import 'dart:io';
import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nuforce/app/utils/url.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:developer' as developer show log;

class ApiClient {
  static final Dio dio = Dio();
  static final ApiClient _instance = ApiClient._internal();
  static ApiClient get instance => _instance;

  factory ApiClient() {
    return _instance;
  }

  ApiClient._internal();

  static init() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    dio.options.baseUrl = Url.baseUrl;
    dio.options.connectTimeout = const Duration(milliseconds: 60000);
    dio.options.receiveTimeout = const Duration(milliseconds: 60000);
    dio.options.receiveDataWhenStatusError = true;
    dio.options.headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.acceptHeader: 'application/json',
      "Authorization": "Bearer ${prefs.getString("token")}",
    };
  }

  Future get({
    required String url,
    Map<String, dynamic>? params,
    required Function onError,
  }) async {
    try {
      final response = await dio.get(
        url,
        queryParameters: params,
      );
      developer.log('URL: $url', name: 'API');
      developer.log('params: $params', name: 'API');
      developer.log('response: ${response.data}', name: 'API');
      return response.data;
    } on DioException catch (e) {
      if (e.response?.statusCode == 500 || e.response?.statusCode == 521) {
        Fluttertoast.showToast(msg: 'Server under maintenance');
      }
      onError();
      developer.log(e.toString());
    } catch (e) {
      // errorMessage(Get.context!, message: 'Something went wrong');
      onError();
      developer.log(e.toString());
    }
  }

  Future post({
    required String url,
    Map<String, dynamic>? body,
    required Function onError,
  }) async {
    developer.log('url:  $url', name: 'API');
    developer.log('body: $body', name: 'API');
    developer.log('headers: ${dio.options.headers.entries}', name: 'API');
    try {
      final response = await dio.post(url, data: body);
      developer.log('response: ${response.data}', name: 'API');
      return response.data;
    } on DioException catch (e) {
      if (e.response?.statusCode == 500 || e.response?.statusCode == 521) {
        Fluttertoast.showToast(msg: 'Server under maintenance');
      }
      onError();
      developer.log(e.toString(), name: 'API');
    } catch (e) {
      onError();
      developer.log(e.toString(), name: 'API');
    }
  }

  Future patch({
    required String url,
    Map<String, dynamic>? body,
    required Function onError,
  }) async {
    developer.log('url:  $url', name: 'API');
    developer.log('body: $body', name: 'API');
    developer.log('headers: ${dio.options.headers.entries}', name: 'API');
    try {
      final response = await dio.patch(url, data: body);
      return response.data;
    } on DioException catch (e) {
      if (e.response?.statusCode == 500 || e.response?.statusCode == 521) {
        Fluttertoast.showToast(msg: 'Server under maintenance');
      }
      onError();
      developer.log(e.toString());
    } catch (e) {
      onError();
      developer.log(e.toString());
    }
  }

  Future put({
    required String url,
    Map<String, dynamic>? body,
    required Function onError,
  }) async {
    developer.log('url:  $url', name: 'API');
    developer.log('body: $body', name: 'API');
    developer.log('headers: ${dio.options.headers.entries}', name: 'API');
    try {
      final response = await dio.put(url, data: body);
      return response.data;
    } on DioException catch (e) {
      if (e.response?.statusCode == 500 || e.response?.statusCode == 521) {
        Fluttertoast.showToast(msg: 'Server under maintenance');
      }
      onError();
      developer.log(e.toString());
    } catch (e) {
      onError();
      developer.log(e.toString());
    }
  }

  Future delete({
    required String url,
    Map<String, dynamic>? body,
    required Function onError,
  }) async {
    developer.log('url:  $url', name: 'API');
    developer.log('body: $body', name: 'API');
    developer.log('headers: ${dio.options.headers.entries}', name: 'API');
    try {
      final response = await dio.delete(url, data: body);
      developer.log('response: ${response.data}', name: 'API');
      return response.data;
    } catch (e) {
      onError();
      developer.log(e.toString());
    }
  }

  Future requestWithFile({
    required String url,
    Map<String, dynamic>? body,
    required List<MapEntry<String, File>> files,
    required Function onError,
  }) async {
    developer.log('url:  $url', name: 'API');
    developer.log('body: $body', name: 'API');
    developer.log('headers: ${dio.options.headers.entries}', name: 'API');
    try {
      developer.log(body.toString());
      FormData formData = FormData.fromMap(body ?? {});
      for (var fileEntry in files) {
        formData.files.add(
          MapEntry(
            fileEntry.key,
            MultipartFile.fromFileSync(fileEntry.value.path, filename: fileEntry.value.path.split("/").last),
          ),
        );
      }
      developer.log(formData.files.toString());
      await Future.delayed(const Duration(seconds: 1));
      developer.log(formData.files.length.toString());
      developer.log(files.length.toString());
      final response = await dio.post(url, data: formData);
      return response.data;
    } catch (e) {
      onError();
      developer.log(e.toString());
    }
  }

  Future createMaidWithPhoto({
    required String url,
    Map<String, dynamic>? body,
    required File file,
  }) async {
    try {
      FormData formData = FormData.fromMap({
        "photo": await MultipartFile.fromFile(file.path, filename: file.path.split("/").last),
      });
      formData.fields.addAll(body?.entries.map((e) => MapEntry(e.key, e.value.toString())) ?? {});
      final response = await dio.post(url, data: formData);
      return response.data;
    } on DioException catch (e) {
      developer.log(e.toString(), name: "requestWithSingleFile");
      return null;
    }
  }
}
