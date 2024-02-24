import 'package:flutter/material.dart';
import 'package:mobile/theme/theme_colors.dart';
import 'package:mobile/theme/typography_styles.dart';

class RatingCard extends StatelessWidget {
  const RatingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 240,
        height: 140,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                spreadRadius: 0,
                blurRadius: 4,
                offset: Offset(0, 4),
              ),
            ],
            color: ThemeColors.white),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.asset(
                        "assets/images/vegetables.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Maria Arnalda",
                    style: TypographyStyles.paragraph3(),
                  )
                ],
              ),
              Text(
                "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                style: TypographyStyles.paragraph3(),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 10,),
              Row(
                children: [
                  Icon(Icons.star, color: Colors.orange[200],),
                  Text("4,75/5")
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
