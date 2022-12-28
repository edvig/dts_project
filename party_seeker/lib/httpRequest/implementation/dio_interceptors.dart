import 'package:dio/dio.dart';
import 'package:party_seeker/shared_prefs/secure_storage.dart';

class DioInterceptors extends InterceptorsWrapper {
  //TODO: Complete methods
  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    var secureStorage = SecureStorage();
    var token = await secureStorage.getToken();
    options.headers = {"Authorization": "Bearer $token"};
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
