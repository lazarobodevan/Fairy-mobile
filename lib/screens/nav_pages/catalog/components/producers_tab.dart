import 'package:flutter/material.dart';
import 'package:mobile/shared/components/producer_details_tile.dart';

import '../../../../shared/components/filter_chips_list.dart';

class ProducersTab extends StatelessWidget {
  const ProducersTab({super.key});

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
          sliver: SliverList.separated(
            itemBuilder: (context, index) {
              return ProducerDetailsTile();
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                height: 20,
              );
            },
          ),
        ),
      ],
    );
  }
}
