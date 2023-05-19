import 'dart:convert';
import 'dart:io';

import 'package:flutter_architecture/network/interceptors/authentication_interceptor.dart';
import 'package:flutter_architecture/network/interceptors/logging_interceptor.dart';
import 'package:http/http.dart' as http;
import 'package:http_interceptor/http/intercepted_client.dart';

import 'api_response.dart';
import 'network_exception.dart';

class NetworkExecutor<T> {
  static final _client = InterceptedClient.build(interceptors: [
    AuthenticationInterceptor(),
    LoggingInterceptor(),
  ]);

  static dynamic execute(
    String endpoint,
    RestType type, {
    Map<String, String>? params,
    Map<String, dynamic>? body,
    Map<String, String>? formData,
    bool isFormData = false,
  }) async {
    dynamic responseJson;
    http.Response response;
    final Uri uri = Uri.parse(endpoint);
    final jsonBody = json.encode(body);
    try {
      switch (type) {
        case RestType.get:
          {
            response = await _client.get(uri, params: params);
            break;
          }
        case RestType.delete:
          {
            response = await _client.delete(uri);
            break;
          }
        case RestType.post:
        case RestType.put:
        case RestType.patch:
          {
            if (isFormData) {
              var request = http.MultipartRequest(
                'POST',
                uri,
              );
              request.fields.addAll(formData!);
              var res = await request.send();
              response = await http.Response.fromStream(res);
            } else {
              response =
                  await _client.post(uri, body: jsonBody, params: params);
              break;
            }
          }
      }
      responseJson = ApiResponse.getResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }
}

enum RestType { get, post, put, patch, delete }
