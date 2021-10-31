class IFirestoreService {
  Future<String?>? add({required Map<String, dynamic> json}) {}
  Future<String?>? addToSubCollection({required String id,required String subCollectionName,required Map<String, dynamic> json}) {}
  Future<bool?>? addWithId({required String id, required Map<String, dynamic> json}) {}
  Future<bool?>? addWithIdToSubCollection({required String id,required String subCollectionName,required String subId,required Map<String, dynamic> json}) {}
  Future<bool?>? update({required String id, required Map<String, dynamic> json}) {}
  Future<bool?>? delete({required String id}) {}
  Future<List?>? get() {}
  Future<List?>? getFromSubCollection({required String id,required String subCollectionName}) {}
  Future<Map?>? getWithId({required String id}) {}
  Future<Map?>? getWithIdFromSubCollection({required String id,required String subColletionName,required String subId}) {}
}
