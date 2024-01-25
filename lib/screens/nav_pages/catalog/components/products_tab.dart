import 'package:flutter/material.dart';
import 'package:mobile/models/filter_chip_options_list_model.dart';
import 'package:mobile/models/filter_option_model.dart';
import 'package:mobile/screens/nav_pages/catalog/components/filter_options.dart';
import 'package:mobile/shared/components/product_tile.dart';

import '../../../../shared/components/filter_chips_list.dart';

class ProductsTab extends StatelessWidget {
  ProductsTab({super.key});

  List<FilterChipOptionsListModel> optionsPerChip = [
    FilterChipOptionsListModel(
      categoryName: "Ordernar por",
      options: [
        FilterOptionModel(
            icon: Icons.swap_vert_rounded,
            label: "Ordenação padrão",
            isSelected: true),
        FilterOptionModel(
            icon: Icons.attach_money_rounded,
            label: "Preço",
            isSelected: false),
        FilterOptionModel(
            icon: Icons.star_border_outlined,
            label: "Avaliação",
            isSelected: false),
        FilterOptionModel(
            icon: Icons.place_outlined,
            label: "Localização",
            isSelected: false),
      ],
    ),
    FilterChipOptionsListModel(
      categoryName: "Distancia",
      options: [
        FilterOptionModel(icon: Icons.add, label: "Produto", isSelected: true)
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: EdgeInsets.symmetric(vertical: 20),
          sliver: SliverToBoxAdapter(
            child: FilterChipsList(filterOptions: optionsPerChip),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 40),
          sliver: SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 10,
              childAspectRatio: 0.8,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return const ProductTile();
              },
              childCount: 50,
            ),
          ),
        ),
      ],
    );
  }
}
