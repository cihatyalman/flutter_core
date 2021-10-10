import 'package:cloud_firestore/cloud_firestore.dart';
import '../abstract/i_firestore_service.dart';

class FirestoreService implements IFirestoreService {
  final FirebaseFirestore firestore;
  final String collectionName;
  FirestoreService({required this.firestore, required this.collectionName});

  @override
  Future<String?> add({required Map<String, dynamic> json}) async {
    try {
      var docRef = await firestore.collection(collectionName).add(json);
      return docRef.id;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<String?> addToSubCollection({
    required String id,
    required String subCollectionName,
    required Map<String, dynamic> json,
  }) async {
    try {
      var docRef = await firestore
          .collection(collectionName)
          .doc(id)
          .collection(subCollectionName)
          .add(json);
      return docRef.id;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<bool?> addWithId({
    required String id,
    required Map<String, dynamic> json,
  }) async {
    try {
      await firestore.collection(collectionName).doc(id).set(json);
      return true;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<bool?> addWithIdToSubCollection({
    required String id,
    required String subCollectionName,
    required String subId,
    required Map<String, dynamic> json,
  }) async {
    try {
      await firestore
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

  @override
  Future<bool?> delete({required String id}) async {
    try {
      await firestore.collection(collectionName).doc(id).delete();
      return true;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<List?> get() async {
    try {
      var snapshot = await firestore.collection(collectionName).get();
      return snapshot.docs.map((e) => e.data()).toList();
    } catch (e) {
      return null;
    }
  }

  @override
  Future<List?> getFromSubCollection({
    required String id,
    required String subCollectionName,
  }) async {
    try {
      var snapshot = await firestore
          .collection(collectionName)
          .doc(id)
          .collection(subCollectionName)
          .get();
      return snapshot.docs.map((e) => e.data()).toList();
    } catch (e) {
      return null;
    }
  }

  @override
  Future<Map?> getWithId({required String id}) async {
    try {
      var snapshot = await firestore.collection(collectionName).doc(id).get();
      return snapshot.data();
    } catch (e) {
      return null;
    }
  }

  @override
  Future<Map?> getWithIdFromSubCollection({
    required String id,
    required String subColletionName,
    required String subId,
  }) async {
    try {
      var snapshot = await firestore
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

  @override
  Future<bool?> update({
    required String id,
    required Map<String, dynamic> json,
  }) async {
    try {
      await firestore.collection(collectionName).doc(id).update(json);
      return true;
    } catch (e) {
      return null;
    }
  }
}
