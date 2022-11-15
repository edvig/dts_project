import 'package:dio/dio.dart';

class DioInterceptors extends InterceptorsWrapper {
  //TODO: Complete methods
  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    //Token
    //Log
    return handler.next(options);
  }

  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) async {
    //Log
    return handler.next(err);
  }

  @override
  Future onResponse(response, handler) async {
    //Log
    return handler.next(response);
  }
}
