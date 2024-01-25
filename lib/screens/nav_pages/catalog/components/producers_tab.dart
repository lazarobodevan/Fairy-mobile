import 'package:flutter/material.dart';
import 'package:mobile/models/filter_chip_options_list_model.dart';
import 'package:mobile/models/filter_option_model.dart';
import 'package:mobile/screens/nav_pages/catalog/components/filter_options.dart';
import 'package:mobile/shared/components/producer_details_tile.dart';

import '../../../../shared/components/filter_chips_list.dart';

class ProducersTab extends StatelessWidget {
  ProducersTab({super.key});

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
    FilterChipOptionsListModel(categoryName: "Distancia", options: [
      FilterOptionModel(icon: Icons.add, label: "Add", isSelected: true)
    ])
  ];

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          sliver: SliverToBoxAdapter(
            child: FilterChipsList(filterOptions: optionsPerChip),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 40),
          sliver: SliverList.separated(
            itemBuilder: (context, index) {
              return ProducerDetailsTile();
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 20,
              );
            },
          ),
        ),
      ],
    );
  }
}
