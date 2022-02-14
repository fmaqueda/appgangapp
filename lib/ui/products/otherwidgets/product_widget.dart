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
        borderRadius: BorderRadius.circular(10),
        color: AppColors.white,
        border: Border.all(
          color: AppColors.colorObscure.withOpacity(0.5),
          width: 2.0,
        ),
      ),
      child: Container(
        margin: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 7,
              child: Center(
                child: (product.photoUrl != null)
                    ? Image.network(
                        product.photoUrl!,
                        fit: BoxFit.fitWidth,
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
                margin: const EdgeInsets.symmetric(horizontal: 2.0),
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
                margin: const EdgeInsets.symmetric(horizontal: 2.0),
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
