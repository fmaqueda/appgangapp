import 'package:appgangapp/models/products/product_model.dart';
import 'package:appgangapp/ui/products/otherwidgets/product_widget.dart';
import 'package:appgangapp/ui/products/screens/product_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductsGridView extends StatelessWidget {
  final List<ProductModel> productsToShow;
  const ProductsGridView({Key? key, required this.productsToShow})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        /*
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 200,
                              childAspectRatio: 4 / 5,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 20),
                      */
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 4 / 5,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        itemCount: productsToShow.length,
        itemBuilder: (BuildContext ctx, index) {
          return GestureDetector(
            onTap: () {
              Get.to(
                () => ProductDetails(
                  productModel: productsToShow[index],
                ),
              );
            },
            child: ProductWidget(product: productsToShow[index]),
          );
        });
  }
}
