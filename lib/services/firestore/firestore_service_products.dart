import 'dart:developer';

import 'package:appgangapp/models/products/product_model.dart';
import 'package:appgangapp/services/firestore/firestore_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseProducts {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  static String _collection = "products";

  static final FirestoreService _firestoreService =
      FirestoreService(_collection);

  Future<bool> createNewProduct(ProductModel product) async {
    try {
      product.uid = _firestoreService.generateId();
      await _firebaseFirestore.collection(_collection).doc(product.uid).set({
        "uid": product.uid,
        "name": product.name,
        "description": product.description,
        "originalPrice": product.originalprice,
        "realPrice": product.realprice
      }, SetOptions(merge: true));
      return true;
    } catch (e) {
      log("$e");
      return false;
    }
  }

  static mergeProductData(ProductModel product) {
    Map<String, dynamic> data = {
      "uid": product.uid,
      "name": product.name,
      "description": product.description,
      "originalPrice": product.originalprice,
      "realPrice": product.realprice
    };
    _firestoreService.merge(product.uid!, data);
  }

  Future<ProductModel> getUser(String uid) async {
    try {
      DocumentSnapshot doc =
          await _firebaseFirestore.collection(_collection).doc(uid).get();

      return ProductModel.fromJson(doc.data() as Map<String, dynamic>);
    } catch (e) {
      log("$e");
      rethrow;
    }
  }
}
