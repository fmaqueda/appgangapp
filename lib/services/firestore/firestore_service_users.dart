import 'dart:developer';

import 'package:appgangapp/models/user_model.dart';
import 'package:appgangapp/services/firestore/firestore_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class DatabaseUsers {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  static String _collection = "users";

  static final FirestoreService _firestoreService =
      FirestoreService(_collection);

  Future<bool> createNewUser(UserModel user) async {
    try {
      await _firebaseFirestore.collection(_collection).doc(user.uid).set(
          {"uid": user.uid, "name": user.name, "email": user.email},
          SetOptions(merge: true));
      return true;
    } catch (e) {
      log("$e");
      return false;
    }
  }

  static mergeUserData(UserModel user) {
    Map<String, dynamic> data = {
      "uid": user.uid,
      "name": user.name,
      "email": user.email,
      "photoUrl": user.photoUrl
    };
    _firestoreService.merge(user.uid!, data);
  }

  Future<UserModel> getUser(String uid) async {
    try {
      DocumentSnapshot doc =
          await _firebaseFirestore.collection(_collection).doc(uid).get();

      return UserModel.fromJson(doc.data() as Map<String, dynamic>);
    } catch (e) {
      log("$e");
      rethrow;
    }
  }
}
