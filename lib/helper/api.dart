import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Api {
  Dio dio = Dio();
  Future<dynamic> get({
    required String url,
    @required String? token,
  }) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    Response response = await dio.get(url,
        options: Options(
          headers: headers,
        ));
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception(
          'There is an error with status code ${response.statusCode}');
    }
  }

  Future<dynamic> post({
    required String url,
    @required dynamic body,
    @required String? token,
  }) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    Response response =
        await dio.post(url, data: body, options: Options(headers: headers));
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception(
          'There is an error with status code ${response.statusCode} and the body is ${response.data}');
    }
  }

  Future<dynamic> put({
    required String url,
    @required dynamic body,
    @required String? token,
  }) async {
    Map<String, String> headers = {};
    headers.addAll({'Content-Type': 'application/x-www-form-urlencoded'});
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    Response response =
        await dio.put(url, data: body, options: Options(headers: headers));
    log(response.data.toString());
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception(
          'There is an error with status code ${response.statusCode} and the body is ${response.data}');
    }
  }
}
