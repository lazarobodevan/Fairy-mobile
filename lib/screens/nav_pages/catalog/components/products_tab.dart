import 'package:flutter/material.dart';
import 'package:mobile/shared/components/custom_filter_chip.dart';
import 'package:mobile/shared/components/producer_details_tile.dart';
import 'package:mobile/shared/components/product_tile.dart';

import '../../../../shared/components/filter_chips_list.dart';

class ProductsTab extends StatelessWidget {
  const ProductsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: EdgeInsets.symmetric(vertical: 20),
          sliver: SliverToBoxAdapter(
            child: FilterChipsList(),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 40),
          sliver: SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 10,
              childAspectRatio: 0.8,
            ),
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                return ProductTile();
              },
              childCount: 50,
            ),
          ),
        ),
      ],
    );
  }
}
