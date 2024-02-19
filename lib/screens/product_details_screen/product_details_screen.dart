import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/screens/product_details_screen/bloc/product_details_bloc.dart';
import 'package:mobile/screens/product_details_screen/components/confirm_order_bottom_widget.dart';
import 'package:mobile/services/product_service.dart';
import 'package:mobile/shared/components/producer_tile/producer_tile.dart';
import 'package:mobile/shared/components/custom_app_bar.dart';
import 'package:mobile/shared/components/custom_dropdown_button.dart';
import 'package:mobile/shared/components/custom_icon_button.dart';
import 'package:mobile/theme/theme_colors.dart';
import 'package:mobile/theme/typography_styles.dart';

class ProductDetailsScreen extends StatelessWidget {
  final String productId;

  const ProductDetailsScreen({Key? key, required this.productId})
      : super(key: key);

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(height: 300, child: ConfirmOrderBottomWidget());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Detalhes do Produto"),
      body: BlocProvider<ProductDetailsBloc>(
        create: (context) => ProductDetailsBloc(
          RepositoryProvider.of<ProductService>(context),
          productId,
        )..add(
            LoadProductDetailsEvent(productId: productId),
          ),
        child: BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
          builder: (context, state) {
            if (state is ProductDetailsLoadedState) {
              var product = state.productModel;
              return Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 235,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              padding: EdgeInsets.only(left: 20, right: 20),
                              itemBuilder: (context, index) {
                                return Center(
                                  child: Container(
                                    width: 280,
                                    height: 176,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: Image.network(
                                        product.pictures[index].url,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                );
                              },
                              itemCount: product.pictures.length,
                              separatorBuilder: (context, index) {
                                return SizedBox(width: 20);
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(20, 0, 20, 40),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  product.name,
                                  style: TypographyStyles.label1(),
                                ),
                                Text(
                                  product.category,
                                  style: TypographyStyles.paragraph3().copyWith(
                                    color: ThemeColors.gray5,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                        text: "R\$${product.price}",
                                        style: TypographyStyles.label1()
                                            .copyWith(
                                                color: ThemeColors.primary3),
                                        children: [
                                          TextSpan(
                                            text: " / 1 ${product.unit}",
                                            style: TypographyStyles.paragraph4()
                                                .copyWith(
                                                    color: ThemeColors.gray5),
                                          ),
                                        ],
                                      ),
                                    ),
                                    CustomDropdownButton(),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                Text(
                                  "Detalhes do produto",
                                  style: TypographyStyles.label2(),
                                ),
                                ExpandableText(
                                  product.description,
                                  style: TypographyStyles.paragraph4()
                                      .copyWith(color: ThemeColors.gray6),
                                  expandText: "Ver mais",
                                  maxLines: 5,
                                  linkColor: ThemeColors.primary3,
                                  animation: true,
                                  animationCurve: Curves.ease,
                                ),
                                const SizedBox(height: 20),
                                Text(
                                  "Detalhes do produtor",
                                  style: TypographyStyles.label2(),
                                ),
                                const SizedBox(height: 10),
                                ProducerTile(producer: product.producer!),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 100,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: ThemeColors.black.withOpacity(.25),
                          blurRadius: 10,
                          offset: Offset(0, 1),
                        ),
                      ],
                      color: ThemeColors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Preço total",
                                style: TypographyStyles.paragraph3(),
                              ),
                              Text(
                                "R\$5,98",
                                style: TypographyStyles.label2(),
                              ),
                            ],
                          ),
                          CustomIconButton(
                            onTap: () => _showBottomSheet(context),
                            icon: Icons.shopping_cart_checkout_outlined,
                            text: "Encomendar",
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }
            if(state is ProductDetailsErrorState){
              return Center(child: Text("Eita que deu erro"),);
            }

            if(state is ProductDetailsLoadingState){
              return Center(child: CircularProgressIndicator(),);
            }
            return SizedBox();
          },
        ),
      ),
    );
  }
}
