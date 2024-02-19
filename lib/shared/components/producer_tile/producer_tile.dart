import 'package:flutter/material.dart';
import 'package:mobile/models/producer_model.dart';
import 'package:mobile/theme/theme_colors.dart';
import 'package:mobile/theme/typography_styles.dart';

class ProducerTile extends StatelessWidget {
  final ProducerModel producer;

  const ProducerTile({super.key, required this.producer});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
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
              child: producer.picture != null
                  ? Image.network(
                      producer.picture!,
                      fit: BoxFit.cover,
                    )
                  : Container(
                      decoration: const BoxDecoration(color: ThemeColors.gray1),
                      child: const Icon(
                        Icons.person,
                        size: 45,
                      ),
                    ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                producer.name,
                style: TypographyStyles.label3(),
              ),
              Text(
                producer.latitude.toString(),
                style: TypographyStyles.label4(),
              ),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    size: 15,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(producer.ratingsAvg.toString()),
                ],
              )
            ],
          ),
          Spacer(),
          Icon(
            Icons.keyboard_arrow_right_rounded,
            size: 30,
            color: ThemeColors.primary3,
          )
        ],
      ),
    );
  }
}
