import 'dart:async';

import 'api_response.dart';

class StreamProvider<T> {
  final StreamController _controller = StreamController<ApiResponse<T>>();

  StreamSink<ApiResponse<T>> get _sink =>
      _controller.sink as StreamSink<ApiResponse<T>>;

  Stream<ApiResponse<T>> get stream =>
      _controller.stream as Stream<ApiResponse<T>>;

  Future<void> makeRequest(Future<T> request) async {
    _sink.add(ApiResponse.loading());
    try {
      T? data = await request;
      _sink.add(ApiResponse.completed(data as T));
    } catch (e) {
      _sink.add(ApiResponse.error(e.toString()));
    }
  }

  void dispose() {
    _controller.close();
  }
}
