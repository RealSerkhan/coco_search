import 'package:flutter/material.dart';

class RestClientResponse {
  final Map<String, dynamic> headers;
  final dynamic body;
  final int statusCode;

  const RestClientResponse({
    required this.headers,
    required this.body,
    required this.statusCode,
  });
}
