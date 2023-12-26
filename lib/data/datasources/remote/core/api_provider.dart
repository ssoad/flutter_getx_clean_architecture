import 'dart:async';
import 'dart:io';

import 'package:flutter_getx_clean_architecture/core/extension/extension.dart';
import 'package:get/get.dart';

import '../../../../core/exception/app_exception.dart';
import 'api_request.dart';

class HTTPProvider {
  static const requestTimeOut = Duration(seconds: 100);
  final _client = GetConnect(timeout: requestTimeOut);

  static final _singleton = HTTPProvider();
  static HTTPProvider get instance => _singleton;

  Future request(IHTTPRequest request) async {
    print(request.body);
    try {
      final response = await _client.request(
        request.url,
        request.method.string,
        headers: request.headers,
        query: request.query,
        body: request.body,
      );
      return _returnResponse(response);
    } on TimeoutException catch (_) {
      throw TimeOutException(null);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }

  dynamic _returnResponse(Response<dynamic> response) {
    switch (response.statusCode) {
      case 200:
        return response.body;
      case 201:
        return response.body;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 404:
        throw BadRequestException('Not found');
      case 422:
        throw RegisterException((response.body)["msg"] ??
            response.body["errors"]["explanation"] ??
            response.body.toString());
      case 500:
        throw FetchDataException(
            response.body["message"] ?? response.body.toString());
      default:
        throw FetchDataException(
            'Error occurred while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}

