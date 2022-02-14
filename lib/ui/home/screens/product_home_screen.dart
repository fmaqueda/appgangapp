import 'package:appgangapp/routes/app_pages.dart';
import 'package:appgangapp/ui/products/controllers/products_controller.dart';
import 'package:appgangapp/ui/products/otherwidgets/product_widget.dart';
import 'package:appgangapp/ui/products/screens/product_details.dart';
import 'package:appgangapp/ui/theme/color_theme.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ProductHomeScreen extends StatelessWidget {
  const ProductHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductController productController = Get.find();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: AppColors.white,
          size: 40.0,
        ),
        onPressed: () {
          Get.toNamed(Routes.ADDPRODUCT);
        },
      ),
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.backgroudColorThree,
          border: Border.all(
            color: AppColors.colorObscure.withOpacity(0.5),
            width: 2.0,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 20),
          child: Column(
            children: [
              Container(
                height: 40,
                child: Text("Barra de Categorías"),
              ),
              Obx(() {
                return Flexible(
                  child: GridView.builder(
                      /*
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 200,
                              childAspectRatio: 4 / 5,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 20),
                      */
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 4 / 5,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 20),
                      itemCount: productController.productsList.value.length,
                      itemBuilder: (BuildContext ctx, index) {
                        return GestureDetector(
                          onTap: () {
                            Get.to(
                              () => ProductDetails(
                                productModel:
                                    productController.productsList.value[index],
                              ),
                            );
                          },
                          child: ProductWidget(
                              product:
                                  productController.productsList.value[index]),
                        );
                      }),
                );
              }),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
      /*
      body: ListView.builder(
          itemCount: productController.productsList.value.length,
          itemBuilder: (context, index) {
            return Column(
              children: const [
                Text("{productController.productsList.value[index].name}"),
              ],
            );
          }),
      */
    );
  }
}
