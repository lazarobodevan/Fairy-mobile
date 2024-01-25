import 'package:flutter/material.dart';
import 'package:mobile/shared/components/custom_filter_chip.dart';
import 'package:mobile/shared/components/product_tile.dart';

import '../../../../shared/components/filter_chips_list.dart';

class ProductsTab extends StatelessWidget {
  const ProductsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FilterChipsList(),
        const SizedBox(height: 20,),
        Expanded(
          child: GridView.builder(
            padding: EdgeInsets.fromLTRB(20,0,20,40),
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
          ),
        ),
      ],
    );
  }
}
