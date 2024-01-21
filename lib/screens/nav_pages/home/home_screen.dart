import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile/shared/components/custom_label.dart';
import 'package:mobile/shared/components/custom_text_field.dart';
import 'package:mobile/shared/components/product_tile.dart';
import 'package:mobile/theme/theme_colors.dart';
import 'package:mobile/theme/typography_styles.dart';

import 'components/svg_category_tile.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  var categories = [
    {"name": "Frutas", "image": "assets/icons/fruits_icon.svg"},
    {"name": "Verduras", "image": "assets/icons/veggies_icon.svg"},
    {"name": "Grãos", "image": "assets/icons/grains_icon.svg"},
    {"name": "Laticínios", "image": "assets/icons/milk_icon.svg"},
    {"name": "Doces", "image": "assets/icons/sweets_icon.svg"},
    {"name": "Frutas", "image": "assets/icons/fruits_icon.svg"}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Header
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 25, 20, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //Greetings
                    Column(
                      children: [
                        Text(
                          "Bom dia,",
                          style: TypographyStyles.paragraph4(),
                        ),
                        Text(
                          "Lázaro",
                          style: TypographyStyles.label2(),
                        ),
                      ],
                    ),
                    //Logo
                    Column(
                      children: [
                        SizedBox(
                          width: 40,
                          height: 40,
                          child: SvgPicture.asset(
                            "assets/icons/logo.svg",
                          ),
                        ),
                        Text(
                          "Fairy",
                          style: TypographyStyles.label4().copyWith(
                            color: ThemeColors.primary5,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
              child: Column(
                children: [
                  CustomTextField(
                    controller: TextEditingController(),
                    hintText: "Buscar produtos, produtores...",
                    prefixIcon: const Icon(
                      Icons.search,
                      color: ThemeColors.primary3,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),

                  //Banner image
                  Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 204,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.green),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset("assets/images/vegetables.png",
                                fit: BoxFit.cover,
                                alignment: Alignment.center)),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 204,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            gradient: const LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [
                                  Color.fromRGBO(30, 30, 30, 1),
                                  Color.fromRGBO(30, 30, 30, .20)
                                ])),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16, right: 69),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Encontre\nalimentos direto\ndo produtor",
                              style: TypographyStyles.headline3()
                                  .copyWith(color: ThemeColors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: const EdgeInsets.only(left: 20),
              child: const CustomLabel(text: "Categorias"),
            ),
            const SizedBox(
              height: 8,
            ),

            //Categories list
            SizedBox(
              height: 82,
              child: ListView.separated(
                padding: const EdgeInsets.only(left: 20, right: 20),
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final category = categories[index];
                  return SvgCategoryTile(
                    iconPath: category['image']!,
                    label: category['name']!,
                    onTap: () {},
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    width: 10,
                  );
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: CustomLabel(text: "Nas Suas Proximidades"),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(20,5,20,50),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Flexible(child: ProductTile()),
                      SizedBox(width: 10,),
                      Flexible(child: ProductTile()),
                    ],
                  ),
                  SizedBox(height: 15,),
                  Row(
                    children: [
                      Flexible(child: ProductTile()),
                      SizedBox(width: 10,),
                      Flexible(child: ProductTile()),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
