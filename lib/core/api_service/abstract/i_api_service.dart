class IApiService {
  Future? postData({required String path, required Map json, Map<String, String>? headers}) {}
  Future? getData({required String path, Map<String, String>? headers}) {}
}
