abstract class IApiService<T> {
  Future<T?>? get({
    required String path,
    Map<String, dynamic>? params,
    Map<String, String>? headers,
  }) {
    return null;
  }

  Future<T?>? post({
    required String path,
    required Map<String, dynamic> json,
    Map<String, dynamic>? params,
    Map<String, String>? headers,
  }) {
    return null;
  }

  Future<T?>? postFormData({
    required String path,
    required Map<String, dynamic> json,
    Map<String, dynamic>? params,
    Map<String, String>? headers,
  }) {
    return null;
  }
}
