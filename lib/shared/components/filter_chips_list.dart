import 'package:flutter/material.dart';
import 'package:mobile/models/filter_chip_options_list_model.dart';
import 'package:mobile/screens/nav_pages/catalog/components/filter_options.dart';

import 'custom_filter_chip.dart';

class FilterChipsList extends StatefulWidget {
  final List<FilterChipOptionsListModel> filterOptions;

  const FilterChipsList({super.key, required this.filterOptions});

  @override
  State<FilterChipsList> createState() => _FilterChipsListState();
}

class _FilterChipsListState extends State<FilterChipsList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      width: double.maxFinite,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: widget.filterOptions.length,
        itemBuilder: (context, index) {
          return CustomFilterChip(
            onSelected: () {},
            isSelected: false,
            icon: Icons.keyboard_arrow_down_rounded,
            text: widget.filterOptions[index].categoryName,
            content: FilterOptions(filterOptions: widget.filterOptions[index].options),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            width: 10,
          );
        },
      ),
    );
  }
}
