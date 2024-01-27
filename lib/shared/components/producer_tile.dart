import 'package:flutter/material.dart';
import 'package:mobile/theme/theme_colors.dart';
import 'package:mobile/theme/typography_styles.dart';

class ProducerTile extends StatelessWidget {
  const ProducerTile({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      borderRadius: BorderRadius.circular(6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(60),
              child: Image.network("https://images.pexels.com/photos/2519332/pexels-photo-2519332.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1", fit: BoxFit.cover,),
            ),
          ),
          const SizedBox(width: 10,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Sebastião da Silva", style: TypographyStyles.label3(),),
              Text("Belo Horizonte - MG", style: TypographyStyles.label4(),),
              Row(
                children: [
                  Icon(Icons.star, size: 15,),
                  const SizedBox(width: 5,),
                  Text("4,65"),
                ],
              )
            ],
          ),
          Spacer(),
          Icon(Icons.keyboard_arrow_right_rounded,size: 30, color: ThemeColors.primary3,)
        ],
      ),
    );
  }
}
