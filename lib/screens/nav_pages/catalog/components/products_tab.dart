import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/models/filter_chip_options_list_model.dart';
import 'package:mobile/models/rounded_filter_option_model.dart';
import 'package:mobile/screens/nav_pages/catalog/bloc/products_tab_bloc/products_tab_bloc.dart';
import 'package:mobile/screens/nav_pages/catalog/components/filter_options.dart';
import 'package:mobile/shared/blocs/geolocation/geolocation_bloc.dart';
import 'package:mobile/shared/components/custom_button.dart';
import 'package:mobile/shared/components/distance_slider.dart';
import 'package:mobile/shared/components/product_card/product_card.dart';
import 'package:mobile/shared/components/product_card/product_card_skeleton.dart';

import '../../../../shared/components/filter_chips_list.dart';

class ProductsTab extends StatelessWidget {
  ProductsTab({super.key});

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
    FilterChipOptionsListModel(
        categoryName: "Distancia",
        customWidget: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DistanceSlider(),
              const SizedBox(
                height: 30,
              ),
              CustomButton(onTap: () {}, text: "Ver resultados")
            ],
          ),
        )),
  ];

  @override
  Widget build(BuildContext context) {
    var geolocationBloc =BlocProvider.of<GeolocationBloc>(context);
    if(geolocationBloc.locationData == null){
      geolocationBloc.add(LoadGeolocationEvent());
    }
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
          sliver: BlocBuilder<ProductsTabBloc, ProductsTabState>(
            builder: (context, state) {
              if (state is ProductsTabLoadedState) {
                if (state.products.data.isEmpty) {
                  return const SliverPadding(
                    padding: EdgeInsets.all(20),
                    sliver: SliverToBoxAdapter(
                      child: Center(
                        child: Text("Nada por aqui..."),
                      ),
                    ),
                  );
                }
                return SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.8,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return ProductCard(
                        product: state.products.data[index],
                      );
                    },
                    childCount: state.products.data.length,
                  ),
                );
              }
              if (state is ProductsTabLoadingState) {
                return SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.8,
                  ),
                  delegate: SliverChildBuilderDelegate(
                        (context, index) {
                      return const ProductCardSkeleton();
                    },
                    childCount: 10,
                  ),
                );
              }

              if(state is ProductsTabErrorState){
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
              return SliverToBoxAdapter();
            },
          ),
        ),
      ],
    );
  }
}
