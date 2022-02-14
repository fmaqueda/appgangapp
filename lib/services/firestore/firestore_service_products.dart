import 'dart:developer';

import 'package:appgangapp/models/products/product_model.dart';
import 'package:appgangapp/services/firestore/firestore_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseProducts {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  static String _collection = "products";

  static final FirestoreService _firestoreService =
      FirestoreService(_collection);

  Stream<List<ProductModel>> productsStream() {
    return _firebaseFirestore
        .collection(_collection)
        .snapshots()
        .map((QuerySnapshot query) {
      List<ProductModel> retVal = [];
      for (var element in query.docs) {
        retVal
            .add(ProductModel.fromJson(element.data() as Map<String, dynamic>));
      }
      print(retVal);
      return retVal;
    });
  }

/*
  Stream<List<ProductModel>> getProductsList() {
    return _firebaseFirestore.collection(_collection).snapshots().map(
        (snapShot) => snapShot.docs
            .map((document) => ProductModel.fromJson(document.data()))
            .toList());
  }
*/

  String generateUID() {
    return _firestoreService.generateId();
  }

  Future<bool> createNewProduct(ProductModel product) async {
    try {
      //product.uid = _firestoreService.generateId();
      await _firebaseFirestore.collection(_collection).doc(product.uid).set({
        "uid": product.uid,
        "name": product.name,
        "description": product.description,
        "originalPrice": product.originalPrice,
        "realPrice": product.realPrice,
        "photoUrl": product.photoUrl,
        "productCategory": product.productCategory
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
      "originalPrice": product.originalPrice,
      "realPrice": product.realPrice
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

  Future<List<String>> getDataIdsCollection(
      String collection, String? firstValue) async {
    CollectionReference _collectionRef =
        FirebaseFirestore.instance.collection(collection);
    // Get docs from collection reference
    QuerySnapshot querySnapshot = await _collectionRef.get();
    final List<DocumentSnapshot> documents = querySnapshot.docs;
    // Get data from docs and convert map to List
    //final allData = querySnapshot.docs.map((doc) => doc.data()).toList();

    List<String> _listCategories = <String>[firstValue!];

    for (var data in documents) {
      _listCategories.add(data.id);
    }

    return _listCategories;
  }

  Future<List<Object?>> getDataCollection(String collection) async {
    CollectionReference _collectionRef =
        FirebaseFirestore.instance.collection(collection);
    // Get docs from collection reference
    QuerySnapshot querySnapshot = await _collectionRef.get();
    final List<DocumentSnapshot> documents = querySnapshot.docs;
    // Get data from docs and convert map to List
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();

    print(allData);
    return allData;
  }
}
