import 'package:flutter/material.dart';
import 'package:mobile/theme/theme_colors.dart';
import 'package:mobile/theme/typography_styles.dart';

class LocationItem extends StatelessWidget {
  const LocationItem({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(6),
      onTap: (){
        Navigator.of(context).pushNamed("/locationDescription");
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.elliptical(40, 40),),
                  border: Border.all(color: ThemeColors.primary2,width: 1)
                ),
                child: const Center(
                  child: Icon(Icons.location_on_outlined,
                      color: ThemeColors.gray6, weight: .1),
                ),
              ),
              const SizedBox(width: 10,),
              Text("Rua das Andradas, 61", style: TypographyStyles.paragraph4(),)
            ],
          ),
          Text("Belo Horizonte - MG", style: TypographyStyles.paragraph4().copyWith(color: ThemeColors.gray6),)
        ],
      ),
    );
  }
}
