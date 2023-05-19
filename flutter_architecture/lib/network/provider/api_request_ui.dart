import 'package:flutter/material.dart';

import 'api_response.dart';

class ApiRequestUI<T> extends StatelessWidget {
  final Stream<ApiResponse<T>> stream;
  final Function onSuccess;
  final BuildContext buildContext;
  final Widget onLoading;

  final Widget onError;

  const ApiRequestUI(
      {Key? key,
      required this.stream,
      required this.onSuccess,
      this.onLoading = const Center(
        child: CircularProgressIndicator(),
      ),
      this.onError = const SizedBox(),
      required this.buildContext})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ApiResponse<T>>(
      stream: stream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          switch (snapshot.data!.status) {
            case Status.LOADING:
              return onLoading;
            case Status.COMPLETED:
              return onSuccess(snapshot.data!.data);
            case Status.ERROR:
              WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                ScaffoldMessenger.of(buildContext).showSnackBar(
                    SnackBar(content: Text(snapshot.data!.message)));
              });
              return onError;
          }
        } else {
          return onLoading;
        }
      },
    );
  }
}
