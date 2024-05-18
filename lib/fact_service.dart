import 'dart:async';

import 'package:chopper/chopper.dart';

class FactService {}

class MyRequestInterceptor implements RequestInterceptor {
  @override
  FutureOr<Request> onRequest(Request request) async {
    print(request);
    print('MyRequestInterceptor');
    return request;
  }
}
