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

  RxString categorySelected = "Selecciona Categoria".obs;

  //RxString imageURL = "".obs;

  var urlImageProduct = ''.obs;
  var pathImageProduct = ''.obs;

  RxList<String> menuCategories = <String>[].obs;

  Rx<List<ProductModel>> productsList = Rx<List<ProductModel>>([]);
  Rx<List<ProductModel>> productsListPerCategory = Rx<List<ProductModel>>([]);

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Rxn<ProductModel>? firestoreProduct = Rxn<ProductModel>();

  @override
  void onInit() async {
    List<String> categorias = await DatabaseProducts()
        .getDataIdsCollection('categories', 'Selecciona Categoria');
    menuCategories.value = categorias;
/*
    List<Object?> _productsJson =
        await DatabaseProducts().getDataCollection('products');

    var products = getProductsFromJson(_productsJson);
*/
    //print(DatabaseProducts().getProductsList().first);

    //print(products[0].name);

    super.onInit();
  }

  @override
  void onReady() {
    productsList.bindStream(DatabaseProducts().productsStream());
    super.onReady();
  }

  // PARA BUSQUEDA DE PRODUCTOS
  TextEditingController searchQueryController = TextEditingController();
  Rx<bool> isSearching = false.obs;
  String searchQuery = "Search query";

  Rx<List<ProductModel>> addProductos = Rx<List<ProductModel>>([]);

  void updateSearchQuery(String newQuery) async {
    List<ProductModel> listProductsSearch;
    addProductos.value.clear();
    searchQuery = newQuery;

    if (productsListPerCategory.value.isEmpty) {
      listProductsSearch = productsList.value;
    } else {
      listProductsSearch = productsListPerCategory.value;
    }
    if (newQuery != "") {
      addProductos.value.addAll(listProductsSearch.where((element) =>
          element.name!.isCaseInsensitiveContains(searchQueryController.text)));
    }

    addProductos.refresh();
    print(addProductos);
  }

  void clearSearchQuery() {
    searchQueryController.clear();
    updateSearchQuery("");
  }

  void stopSearching() {
    clearSearchQuery();
    isSearching.value = false;
  }

/*
  List<String> menuCategories = <String>[
    'Selecciona Categoria',
    'HOMBRE',
    'MUJER',
    'NI??OS',
    'EQUIPAMIENTO'
  ];
*/

  List<ProductModel> getProductsFromJson(List<Object?> jsonProducts) {
    List<ProductModel> _products = <ProductModel>[];

    print(jsonProducts.length);

    for (var element in jsonProducts) {
      _products.add(ProductModel.fromJson(element as Map<String, dynamic>));
    }

    return _products;
  }

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

  String genProductUID() {
    return DatabaseProducts().generateUID();
  }
}
