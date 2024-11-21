import 'dart:convert';
import 'package:ci_task/networking/web_service_constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'network_check.dart';

class HttpService {
  //! HTTP Get API Calls.
  Future<dynamic> get({
    required String endpoint,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParams,
    final dynamic Function(bool)? onError,
  }) async {
    final bool isNetworkAvailable = await NetworkCheck().check();
    if (isNetworkAvailable) {
      try {
        final response = await http.get(
          Uri.parse(endpoint),
        );
        if (response.statusCode != 504) {
          var responseJson = json.decode(response.body.toString());
          return responseJson;
        } else {
          return WebserviceConstants.gatewayError;
        }
      } on Exception catch (_) {}
    }
    return onError != null ? onError(isNetworkAvailable) : false;
  }

//! HTTP Post Api Call.
  Future<Map<String, dynamic>> post({required String endpoint, dynamic body, final dynamic Function(bool)? onError}) async {
    final bool isNetworkAvailable = await NetworkCheck().check();
    if (isNetworkAvailable) {
      debugPrint(body);

      try {
        final response = await http.post(
          Uri.parse(endpoint),
          body: body,
        );
        if (response.statusCode != 504) {
          var responseJson = json.decode(response.body.toString());
          responseJson.putIfAbsent("status_code", () => response.statusCode);
          return responseJson;
        } else {
          return WebserviceConstants.gatewayError;
        }
      } on Exception catch (_) {
        debugPrint('$_');
      }
    }
    return onError != null ? onError(isNetworkAvailable) : null;
  }

  Future<Map<String, dynamic>> patch({required String endpoint, dynamic body, final dynamic Function(bool)? onError}) async {
    final bool isNetworkAvailable = await NetworkCheck().check();
    if (isNetworkAvailable) {
      try {
        final response = await http.patch(
          Uri.parse(endpoint),
          body: body,
        );
        if (response.statusCode != 504) {
          var responseJson = json.decode(response.body.toString());
          responseJson.putIfAbsent("status_code", () => response.statusCode);
          return responseJson;
        } else {
          return WebserviceConstants.gatewayError;
        }
      } on Exception catch (_) {
        debugPrint('$_');
      }
    }
    return onError != null ? onError(isNetworkAvailable) : null;
  }

  Future<Map<String, dynamic>> put({required String endpoint, dynamic body, final dynamic Function(bool)? onError}) async {
    final bool isNetworkAvailable = await NetworkCheck().check();
    if (isNetworkAvailable) {
      try {
        final response = await http.put(
          Uri.parse(endpoint),
          body: body,
        );
        if (response.statusCode != 504) {
          var responseJson = json.decode(response.body.toString());
          responseJson.putIfAbsent("status_code", () => response.statusCode);
          return responseJson;
        } else {
          return WebserviceConstants.gatewayError;
        }
      } on Exception catch (_) {
        debugPrint('$_');
      }
    }
    return onError != null ? onError(isNetworkAvailable) : null;
  }

//! HTTP Delete Api Call.
  Future<dynamic> delete(
      {required String endpoint,
      // dynamic body,
      final dynamic Function(bool)? onError}) async {
    final bool isNetworkAvailable = await NetworkCheck().check();
    if (isNetworkAvailable) {
      try {
        final response = await http.delete(
          Uri.parse(endpoint),
        );
        if (response.statusCode != 504) {
          var responseJson = json.decode(response.body.toString());
          responseJson.putIfAbsent("status_code", () => response.statusCode);
          return responseJson;
        } else {
          return WebserviceConstants.gatewayError;
        }
      } on Exception catch (_) {
        debugPrint('$_');
      }
    }
    return onError != null ? onError(isNetworkAvailable) : null;
  }
}
