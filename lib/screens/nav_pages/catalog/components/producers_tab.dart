import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/models/filter_chip_options_list_model.dart';
import 'package:mobile/models/rounded_filter_option_model.dart';
import 'package:mobile/screens/nav_pages/catalog/bloc/producers_tab_bloc/tab_bloc.dart';
import 'package:mobile/screens/nav_pages/catalog/bloc/producers_tab_bloc/tab_event.dart';
import 'package:mobile/screens/nav_pages/catalog/bloc/producers_tab_bloc/tab_state.dart';
import 'package:mobile/screens/nav_pages/catalog/components/filter_options.dart';
import 'package:mobile/services/producer_service.dart';
import 'package:mobile/shared/blocs/geolocation/geolocation_bloc.dart';
import 'package:mobile/shared/components/producer_tile/producer_tile.dart';
import 'package:mobile/shared/components/producer_tile/producer_tile_skeleton.dart';
import 'package:mobile/shared/repositories/geolocation/geolocation_repository.dart';
import 'package:mobile/theme/theme_colors.dart';

import '../../../../shared/components/filter_chips_list.dart';

class ProducersTab extends StatelessWidget {
  ProducersTab({super.key});

  List<FilterChipOptionsListModel> optionsPerChip = [
    FilterChipOptionsListModel(
      categoryName: "Ordernar por",
      options: [
        RoundedFilterOptionModel(
            icon: Icons.swap_vert_rounded,
            label: "Ordenação padrão",
            isSelected: true),
        RoundedFilterOptionModel(
            icon: Icons.attach_money_rounded,
            label: "Preço",
            isSelected: false),
        RoundedFilterOptionModel(
            icon: Icons.star_border_outlined,
            label: "Avaliação",
            isSelected: false),
        RoundedFilterOptionModel(
            icon: Icons.place_outlined,
            label: "Localização",
            isSelected: false),
      ],
    ),
    FilterChipOptionsListModel(categoryName: "Distancia", options: [
      RoundedFilterOptionModel(icon: Icons.add, label: "Add", isSelected: true)
    ])
  ];

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          sliver: SliverToBoxAdapter(
            child: FilterChipsList(
              filterOptions: optionsPerChip,
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 40),
          sliver: BlocBuilder<ProducersTabBloc, ProducersTabState>(
            builder: (context, state) {
              if (state is ProducersTabLoadingState) {
                return SliverList.separated(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return const ProducerTileSkeleton();
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 20,
                    );
                  },
                );
              }

              if (state is ProducersTabLoadedState) {
                var producers = state.producers.data;
                return SliverList.separated(
                  itemCount: producers.length,
                  itemBuilder: (context, index) {
                    return ProducerTile(producer: producers[index]);
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 20,
                    );
                  },
                );
              }
              if (state is ProducersTabLoadErrorState) {
                return const SliverFillRemaining(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.warning_amber,
                          size: 40,
                          color: Colors.red,
                        ),
                        Text("Ocorreu um erro ao buscar no servidor :("),
                      ],
                    ),
                  ),
                );
              }

              return SizedBox();
            },
          ),
        ),
      ],
    );
  }
}
