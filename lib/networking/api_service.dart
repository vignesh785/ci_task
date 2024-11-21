import 'dart:convert';
import '../networking/http_service.dart';
import '../networking/api_interface.dart';

// import 'package:/src/services/networking/http_service.dart';
import 'package:flutter/material.dart';

class ApiService implements ApiInterface {
  final HttpService _httpService = HttpService();

  @override
  Future<T> getData<T>(
      {required String endpoint,
      Map<String, dynamic>? queryParams,
      required T Function(dynamic responseBody) converter,
      Function(bool)? onError}) async {
    final data = await _httpService.get(
      endpoint: endpoint,
      queryParams: queryParams,
    );
    return converter(data);
  }

  @override
  Future<T> setData<T>({
    required String endpoint,
    dynamic data,
    required T Function(Map<String, dynamic> response) converter,
    final dynamic Function(bool)? onError,
  }) async {
    final dataMap = await _httpService.post(
      endpoint: endpoint,
      body: jsonEncode(data),
    );
    debugPrint(dataMap.toString());
    return converter(dataMap);
  }

  @override
  Future<T> updateData<T>(
      {required String endpoint,
      required Map<String, dynamic> data,
      required T Function(Map<String, dynamic> response) converter,
      final dynamic Function(bool)? onError}) async {
    final dataMap = await _httpService.put(
      endpoint: endpoint,
      body: jsonEncode(data),
    );
    return converter(dataMap);
  }

  @override
  Future<T> patchData<T>(
      {required String endpoint,
      required Map<String, dynamic> data,
      required T Function(Map<String, dynamic> response) converter,
      final dynamic Function(bool)? onError}) async {
    final dataMap = await _httpService.patch(
      endpoint: endpoint,
      body: jsonEncode(data),
    );
    return converter(dataMap);
  }

  @override
  Future<T> deleteData<T>(
      {required String endpoint,
      Map<String, dynamic>? data,
      required T Function(Map<String, dynamic> response) converter,
      final dynamic Function(bool)? onError}) async {
    final dataMap = await _httpService.delete(
      endpoint: endpoint,
      // body: jsonEncode(data),
    );
    debugPrint(dataMap.toString());
    return converter(dataMap);
  }
}
