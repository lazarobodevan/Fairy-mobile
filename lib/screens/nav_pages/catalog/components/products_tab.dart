import 'package:flutter/material.dart';
import 'package:mobile/shared/components/product_tile.dart';

class ProductsTab extends StatelessWidget {
  const ProductsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 10,
        childAspectRatio: 0.8
      ),
      itemBuilder: (context, index) {
        return ProductTile();
      },
      itemCount: 50,
    );
  }
}
