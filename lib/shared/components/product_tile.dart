import 'package:flutter/material.dart';
import 'package:mobile/theme/theme_colors.dart';
import 'package:mobile/theme/typography_styles.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: (){
          Navigator.of(context).pushNamed("/productDetails");
        },
        child: Ink(
          height: 230,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              spreadRadius: 0,
              blurRadius: 4,
              offset: Offset(0, 4),
            ),
          ], color: ThemeColors.white,),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.maxFinite,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    "https://images.pexels.com/photos/143133/pexels-photo-143133.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                    height: 95,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
                child: Column(
                  children: [
                    Text("Cenoura Laranja - orgânico"),
                    const SizedBox(height: 6,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("R\$2,89", style: TypographyStyles.label2(),),
                        Text("1kg", style: TypographyStyles.paragraph4().copyWith(color: ThemeColors.gray6),),
                      ],
                    ),
                    const SizedBox(height: 20,),
                    Icon(Icons.add_shopping_cart, color: ThemeColors.primary3,),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
