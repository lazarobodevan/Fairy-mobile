import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:mobile/screens/product_details_screen/components/confirm_order_bottom_widget.dart';
import 'package:mobile/screens/product_details_screen/components/producer_details_tile.dart';
import 'package:mobile/shared/components/custom_app_bar.dart';
import 'package:mobile/shared/components/custom_dropdown_button.dart';
import 'package:mobile/shared/components/custom_icon_button.dart';
import 'package:mobile/theme/theme_colors.dart';
import 'package:mobile/theme/typography_styles.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {

  _showBottomSheet(){
    showModalBottomSheet(context: context, builder: (BuildContext context){
      return SizedBox(height:300,child: ConfirmOrderBottomWidget());
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Detalhes do Produto"),
      body: Column(
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
                                  borderRadius: BorderRadius.circular(12)),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.network(
                                  "https://images.pexels.com/photos/143133/pexels-photo-143133.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          );
                        },
                        itemCount: 3,
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            width: 20,
                          );
                        }),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Cenoura laranja - orgânico",
                          style: TypographyStyles.label1(),
                        ),
                        Text(
                          "Frutas",
                          style: TypographyStyles.paragraph3().copyWith(
                            color: ThemeColors.gray5,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(
                              text: TextSpan(
                                text: "R\$2,99",
                                style: TypographyStyles.label1()
                                    .copyWith(color: ThemeColors.primary3),
                                children: [
                                  TextSpan(
                                    text: " / 1 kg",
                                    style: TypographyStyles.paragraph4()
                                        .copyWith(color: ThemeColors.gray5),
                                  ),
                                ],
                              ),
                            ),
                            CustomDropdownButton(),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Detalhes do produto",
                          style: TypographyStyles.label2(),
                        ),
                        ExpandableText(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque sapien nibh, egestas non metus vel, faucibus mollis elit. Nulla posuere vulputate justo vitae accumsan. Nullam velit massa, pulvinar sed lacus in, euismod feugiat ligula. Integer sodales efficitur erat, et ornare nibh maximus vitae.  Nulla venenatis, urna quis varius venenatis, urna neque rhoncus nisi, quis commodo justo urna a metus. Sed in enim mauris. Cras feugiat diam nec porta facilisis. Donec bibendum neque placerat sapien imperdiet, tristique tempus mauris scelerisque. Suspendisse viverra arcu sapien, sed efficitur nisi tristique vel. Cras luctus non enim ac gravida. Suspendisse euismod lacinia ipsum, non pellentesque urna rutrum quis. Nunc pharetra in neque sit amet pellentesque.",
                          style: TypographyStyles.paragraph4().copyWith(color: ThemeColors.gray6),
                          expandText: "Ver mais",
                          maxLines: 5,
                          linkColor: ThemeColors.primary3,
                          animation: true,
                          animationCurve: Curves.ease,
                        ),
                        const SizedBox(height: 20,),
                        Text(
                          "Detalhes do produtor",
                          style: TypographyStyles.label2(),
                        ),
                        const SizedBox(height: 10,),
                        ProducerDetailsTile()
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
                  offset: Offset(0,1)
                ),
              ],
              color: ThemeColors.white
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(30,0,30,0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Preço total", style: TypographyStyles.paragraph3(),),
                      Text("R\$5,98", style: TypographyStyles.label2(),)
                    ],
                  ),
                  CustomIconButton(onTap: _showBottomSheet,)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}