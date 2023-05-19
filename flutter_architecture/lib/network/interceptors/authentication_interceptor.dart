import 'package:flutter_architecture/utils/shared_preferences.dart';
import 'package:http_interceptor/http/http.dart';
import 'package:http_interceptor/models/request_data.dart';
import 'package:http_interceptor/models/response_data.dart';

class AuthenticationInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    var token = await SharedPreferencesUtils.getToken();
    data.headers.putIfAbsent("Authorization", () => "Bearer $token");
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    return data;
  }
}
