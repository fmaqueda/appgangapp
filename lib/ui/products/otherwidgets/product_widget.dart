import 'package:appgangapp/models/products/product_model.dart';
import 'package:appgangapp/ui/theme/color_theme.dart';
import 'package:appgangapp/ui/theme/text_theme.dart';
import 'package:flutter/material.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({Key? key, required this.product}) : super(key: key);

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20.0, right: 20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.white,
        border: Border.all(
          color: AppColors.colorObscure.withOpacity(0.6),
          width: 0.0,
        ),
      ),
      child: Container(
        margin: const EdgeInsets.all(0.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 7,
              child: Center(
                child: (product.photoUrl != null)
                    ? ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(18),
                          topRight: Radius.circular(18),
                        ),
                        child: Image.network(
                          product.photoUrl!,
                          width: double.infinity,
                          fit: BoxFit.fill,
                        ),
                      )
                    : const Text("No Image"),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Flexible(
              flex: 1,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10.0),
                width: double.infinity,
                child: (product.name != null)
                    ? Text(
                        product.name!,
                        style: textThemePropio.subtitle2!
                            .copyWith(color: AppColors.textColor),
                        textAlign: TextAlign.start,
                      )
                    : Text(
                        "Product Not Recovered",
                        style: textThemePropio.subtitle2!
                            .copyWith(color: AppColors.textColor),
                        textAlign: TextAlign.start,
                      ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10.0),
                width: double.infinity,
                child: (product.realPrice != null)
                    ? Text(
                        product.realPrice! + " €",
                        textAlign: TextAlign.end,
                        style: textThemePropio.subtitle2!
                            .copyWith(color: AppColors.textColor),
                      )
                    : Text(
                        "Price Not Recovered",
                        style: textThemePropio.subtitle2!
                            .copyWith(color: AppColors.textColor),
                        textAlign: TextAlign.end,
                      ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
