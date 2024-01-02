// ignore_for_file: strict_raw_type

import 'dart:developer' as developer show log;
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:nuforce/app/utils/url.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiClient {
  static final Dio dio = Dio();
  static final ApiClient _instance = ApiClient._internal();
  static ApiClient get instance => _instance;

  factory ApiClient() {
    return _instance;
  }

  ApiClient._internal();

  static Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();
    dio.options.baseUrl = URL.baseUrl;
    dio.options.connectTimeout = const Duration(milliseconds: 60000);
    dio.options.receiveTimeout = const Duration(milliseconds: 60000);
    dio.options.receiveDataWhenStatusError = true;
    dio.options.headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.acceptHeader: 'application/json',
      if (prefs.getString('token') != null) 'Authorization': "Bearer ${prefs.getString("token")}",
    };
  }

  Future<Response> get({
    required String url,
    Map<String, dynamic>? params,
  }) async {
    final response = await dio.get(
      url,
      queryParameters: params,
    );
    developer.log('URL: $url', name: 'API');
    developer.log('params: $params', name: 'API');
    Logger().i(response.data);
    return response;
  }

  Future<Response> post({
    required String url,
    Map<String, dynamic>? body,
  }) async {
    developer.log('url:  $url', name: 'API');
    developer.log('body: $body', name: 'API');
    developer.log('headers: ${dio.options.headers.entries}', name: 'API');

    final Response response = await dio.post(url, data: body);
    Logger().i(response);
    return response;
  }

  Future patch({
    required String url,
    Map<String, dynamic>? body,
  }) async {
    developer.log('url:  $url', name: 'API');
    developer.log('body: $body', name: 'API');
    developer.log('headers: ${dio.options.headers.entries}', name: 'API');
    final response = await dio.patch(url, data: body);
    Logger().i(response);
    return response;
  }

  Future put({
    required String url,
    Map<String, dynamic>? body,
  }) async {
    developer.log('url:  $url', name: 'API');
    developer.log('body: $body', name: 'API');
    developer.log('headers: ${dio.options.headers.entries}', name: 'API');
    final response = await dio.put(url, data: body);
    Logger().i(response);
    return response;
  }

  Future delete({
    required String url,
    Map<String, dynamic>? body,
  }) async {
    developer.log('url:  $url', name: 'API');
    developer.log('body: $body', name: 'API');
    developer.log('headers: ${dio.options.headers.entries}', name: 'API');
    final response = await dio.delete(url, data: body);
    Logger().i(response);
    return response;
  }

  Future requestWithFile({
    required String url,
    Map<String, dynamic>? body,
    required List<MapEntry<String, File>> files,
  }) async {
    developer.log('url:  $url', name: 'API');
    developer.log('body: $body', name: 'API');
    developer.log('headers: ${dio.options.headers.entries}', name: 'API');

    developer.log(body.toString());
    FormData formData = FormData.fromMap(body ?? {});
    for (var fileEntry in files) {
      formData.files.add(
        MapEntry(
          fileEntry.key,
          MultipartFile.fromFileSync(fileEntry.value.path, filename: fileEntry.value.path.split('/').last),
        ),
      );
    }
    developer.log(formData.files.toString());
    await Future.delayed(const Duration(seconds: 1));
    developer.log(formData.files.length.toString());
    developer.log(files.length.toString());
    final response = await dio.post(url, data: formData);
    Logger().i(response);
    return response;
  }

  Future createMaidWithPhoto({
    required String url,
    Map<String, dynamic>? body,
    required File file,
  }) async {
    FormData formData = FormData.fromMap({
      'photo': await MultipartFile.fromFile(file.path, filename: file.path.split('/').last),
    });
    formData.fields.addAll(body?.entries.map((e) => MapEntry(e.key, e.value.toString())) ?? {});
    final response = await dio.post(url, data: formData);
    Logger().i(response);
    return response;
  }
}
