import 'package:flutter/material.dart';
import 'package:mobile/models/product/product_model.dart';
import 'package:mobile/theme/theme_colors.dart';
import 'package:mobile/theme/typography_styles.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;
  const ProductCard({Key? key, required this.product});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed("/productDetails", arguments: product.id);
      },
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              spreadRadius: 0,
              blurRadius: 4,
              offset: Offset(0, 4),
            ),
          ],
          color: ThemeColors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.maxFinite,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  product.pictures[0].url,
                  height: 95,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
              child: Column(
                children: [
                  Text(product.name),
                  const SizedBox(height: 6,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("R\$${product.price}", style: TypographyStyles.label2(),),
                      Text("1 ${product.unit}", style: TypographyStyles.paragraph4().copyWith(color: ThemeColors.gray6),),
                    ],
                  ),
                  const SizedBox(height: 20,),
                  Icon(Icons.add_shopping_cart, color: ThemeColors.primary3,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}