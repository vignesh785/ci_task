// ignore_for_file: constant_identifier_names
// DO NOT USE 'dartfmt' on this file for formatting

import 'package:flutter/material.dart';

@immutable
class ApiEndpoint {
  const ApiEndpoint._();
  static const String baseUrl = 'https://jsonplaceholder.typicode.com';

  static String jsonplaceholder({JsonplaceholderEndPoint? endpoint, int? page, int? perPage, String? query}) {
    switch (endpoint!) {
      case JsonplaceholderEndPoint.Photos:
        return '$baseUrl/photos?_page=$page&_limit=$perPage';
      case JsonplaceholderEndPoint.Search:
        return '$baseUrl/photos?title_like=$query';
    }
  }
}

enum JsonplaceholderEndPoint { Photos, Search }
