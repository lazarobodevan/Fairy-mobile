import 'package:flutter/material.dart';

import 'custom_filter_chip.dart';

class FilterChipsList extends StatefulWidget {
  const FilterChipsList({super.key});

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
        padding: EdgeInsets.symmetric(horizontal: 20),
        itemCount: 6,
        itemBuilder: (context, index){
          return CustomFilterChip(onSelected: (){},isSelected: true,icon: Icons.keyboard_arrow_down_rounded,text: "Ordenar",);
        },
        separatorBuilder: (context, index){
          return const SizedBox(width: 10,);
        },
      ),
    );
  }
}
