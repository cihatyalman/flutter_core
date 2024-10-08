import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseFirestoreService {
  static final FirebaseFirestoreService _instance =
      FirebaseFirestoreService._internal();
  factory FirebaseFirestoreService() => _instance;
  FirebaseFirestoreService._internal();

  final instance = FirebaseFirestore.instance;

  Future<String?> add({
    required String collectionName,
    required Map<String, dynamic> json,
  }) async {
    try {
      var docRef = await instance.collection(collectionName).add(json);
      return docRef.id;
    } catch (e) {
      return null;
    }
  }

  Future<String?> addToSubCollection({
    required String id,
    required String collectionName,
    required String subCollectionName,
    required Map<String, dynamic> json,
  }) async {
    try {
      var docRef = await instance
          .collection(collectionName)
          .doc(id)
          .collection(subCollectionName)
          .add(json);
      return docRef.id;
    } catch (e) {
      return null;
    }
  }

  Future<bool?> addWithId({
    required String id,
    required String collectionName,
    required Map<String, dynamic> json,
  }) async {
    try {
      await instance.collection(collectionName).doc(id).set(json);
      return true;
    } catch (e) {
      return null;
    }
  }

  Future<bool?> addWithIdToSubCollection({
    required String id,
    required String collectionName,
    required String subCollectionName,
    required String subId,
    required Map<String, dynamic> json,
  }) async {
    try {
      await instance
          .collection(collectionName)
          .doc(id)
          .collection(subCollectionName)
          .doc(subId)
          .set(json);
      return true;
    } catch (e) {
      return null;
    }
  }

  Future<bool?> delete({
    required String collectionName,
    required String id,
  }) async {
    try {
      await instance.collection(collectionName).doc(id).delete();
      return true;
    } catch (e) {
      return null;
    }
  }

  Future<List?> get({required String collectionName}) async {
    try {
      var snapshot = await instance.collection(collectionName).get();
      return snapshot.docs.map((e) => e.data()).toList();
    } catch (e) {
      return null;
    }
  }

  Future<List?> getFromSubCollection({
    required String id,
    required String collectionName,
    required String subCollectionName,
  }) async {
    try {
      var snapshot = await instance
          .collection(collectionName)
          .doc(id)
          .collection(subCollectionName)
          .get();
      return snapshot.docs.map((e) => e.data()).toList();
    } catch (e) {
      return null;
    }
  }

  Future<Map?> getWithId({
    required String collectionName,
    required String id,
  }) async {
    try {
      var snapshot = await instance.collection(collectionName).doc(id).get();
      return snapshot.data();
    } catch (e) {
      return null;
    }
  }

  Future<Map?> getWithIdFromSubCollection({
    required String id,
    required String collectionName,
    required String subColletionName,
    required String subId,
  }) async {
    try {
      var snapshot = await instance
          .collection(collectionName)
          .doc(id)
          .collection(subColletionName)
          .doc(subId)
          .get();
      return snapshot.data();
    } catch (e) {
      return null;
    }
  }

  Future<bool?> update({
    required String id,
    required String collectionName,
    required Map<String, dynamic> json,
  }) async {
    try {
      await instance.collection(collectionName).doc(id).update(json);
      return true;
    } catch (e) {
      return null;
    }
  }
}
