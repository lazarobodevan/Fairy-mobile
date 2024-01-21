import 'package:flutter/material.dart';
import 'package:mobile/shared/components/product_tile.dart';

class ProductsTab extends StatelessWidget {
  const ProductsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: 0.8,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      children: List.generate(
        20,
        (index) => ProductTile(),
      ),
    );
  }
}
