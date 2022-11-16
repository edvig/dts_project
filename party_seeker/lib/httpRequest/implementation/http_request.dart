abstract class HttpRequest {
  void setBaseUrl(String baseUrl);
  void setHeader(Map<String, String> hearder);

  Future<dynamic> get(String url);
  Future<dynamic> put(String url, {Map<String, dynamic>? body});
  Future<dynamic> post(String url, {Map<String, dynamic>? body});
  Future<dynamic> delete(String url, {Map<String, dynamic>? body});
  Future<dynamic> patch(String url, {Map<String, dynamic>? body});
}
