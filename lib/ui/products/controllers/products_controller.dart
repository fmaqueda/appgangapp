import 'dart:developer';

import 'package:appgangapp/models/products/product_model.dart';
import 'package:appgangapp/services/firestore/firestore_service_products.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  TextEditingController nameProduct = TextEditingController();
  TextEditingController originalPrice = TextEditingController();
  TextEditingController realPrice = TextEditingController();
  TextEditingController descriptionProduct = TextEditingController();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Rxn<ProductModel>? firestoreProduct = Rxn<ProductModel>();

  Future<void> updateProduct(BuildContext context, ProductModel product) async {
    try {
      _db.doc('/products/${product.uid}').update(product.toJson());
      update();
    } catch (e) {
      log("${e}");
    }
  }

  Future<bool> createProduct(ProductModel product) async {
    return DatabaseProducts().createNewProduct(product);
  }
}
