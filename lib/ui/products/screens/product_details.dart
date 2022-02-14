import 'package:appgangapp/models/products/product_model.dart';
import 'package:appgangapp/ui/products/screens/webview_product.dart';
import 'package:appgangapp/ui/theme/color_theme.dart';
import 'package:appgangapp/ui/theme/text_theme.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ProductDetails extends StatelessWidget {
  final ProductModel productModel;
  const ProductDetails({Key? key, required this.productModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.ad_units),
        onPressed: (() => Get.to(const WebViewProduct())),
      ),
      backgroundColor: Colors.green,
      body: Padding(
        padding: const EdgeInsets.only(top: 40, left: 30, right: 30),
        child: ListView(
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () => Get.back(),
                  child: Container(
                    height: 40,
                    width: 40,
                    color: AppColors.white,
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
              child: Container(
                height: 500,
                width: double.infinity,
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50)),
                      child: Image.network(
                        productModel.photoUrl!,
                        height: 200,
                        width: double.infinity,
                        fit: BoxFit.fill,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 10.0,
                        right: 10.0,
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(productModel.name!),
                              Text(
                                productModel.originalPrice!,
                                style: const TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    color: Colors.grey),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Transform.rotate(
                                angle: 50,
                                child: const Icon(
                                  Icons.star,
                                  color: Colors.green,
                                  size: 40,
                                ),
                              ),
                              Text(
                                productModel.realPrice!,
                                style: textThemePropio.headline1,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(productModel.description!),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
