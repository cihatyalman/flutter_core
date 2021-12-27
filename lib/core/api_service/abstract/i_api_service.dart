class IApiService<T> {
  Future<T?>? get({
    required String path,
    Map<String, String>? headers,
  }) {}

  Future<T?>? post({
    required String path,
    required Map<String,dynamic> json,
    Map<String, String>? headers,
  }) {}

  Future<T?>? postFormData({
    required String path,
    required Map<String,dynamic> json,
    Map<String, String>? headers,
  }) {}
}
