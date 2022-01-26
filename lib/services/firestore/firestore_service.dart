import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService<T> {
  String _logName = "Firestore Service";

  final String collection;

  FirestoreService(this.collection);

  _logError(e) => log("Firestore error", name: _logName, error: e);

  //GENERATE ID
  String generateId() {
    return FirebaseFirestore.instance.collection(collection).doc().id;
  }

  //ADD
  Future<DocumentReference> add(Map<String, dynamic> data) {
    return FirebaseFirestore.instance
        .collection(collection)
        .add(data)
        .catchError((err) {
      _logError(err);
    });
  }

  //SET SetOptions = false
  Future<void> set(
    String id,
    Map<String, dynamic> data,
  ) {
    return FirebaseFirestore.instance
        .collection(collection)
        .doc(id)
        .set(data)
        .catchError((err) {
      _logError(err);
    });
  }

  //UPDATE
  Future<void> update(String id, Map<String, dynamic> data) {
    return FirebaseFirestore.instance
        .collection(collection)
        .doc(id)
        .update(data)
        .catchError((err) {
      _logError(err);
    });
  }

  //MERGE SetOptions = true
  Future<void> merge(String id, Map<String, dynamic> data,
      {bool mergeData = true}) {
    return FirebaseFirestore.instance
        .collection(collection)
        .doc(id)
        .set(data, SetOptions(merge: mergeData))
        .catchError((err) {
      _logError(err);
    });
  }
}
