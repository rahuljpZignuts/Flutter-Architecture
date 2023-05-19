import 'package:flutter/foundation.dart';
import 'package:http_interceptor/http/http.dart';
import 'package:http_interceptor/models/request_data.dart';
import 'package:http_interceptor/models/response_data.dart';

class LoggingInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    if (kDebugMode) {
      print("HTTP REQUEST  ========================================");
      print("Base Url == ${data.url}");
      if (data.headers.isNotEmpty) {
        data.headers.forEach((key, value) {
          print("Headers == $key -- $value");
        });
      }
      if (data.params.isNotEmpty) {
        data.params.forEach((key, value) {
          print("Query Params  == $key -- $value");
        });
      }
      print("Body == ${data.body}");
    }
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    if (kDebugMode) {
      print("HTTP RESPONSE  ========================================");
      print("Base Url == ${data.url}");
      print("Status Code == ${data.statusCode}");
      print("Body == ${data.body}");
    }
    return data;
  }
}
