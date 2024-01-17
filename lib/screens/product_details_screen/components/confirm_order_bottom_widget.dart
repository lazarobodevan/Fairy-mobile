import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:mobile/shared/components/action_button.dart';
import 'package:mobile/theme/theme_colors.dart';
import 'package:mobile/theme/typography_styles.dart';

class ConfirmOrderBottomWidget extends StatelessWidget {
  const ConfirmOrderBottomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              "Confirmar encomenda?",
              style: TypographyStyles.label1(),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 2,
                  child: Text(
                    "Cenoura - orgânica- bonita laranja e bonita e laranja e cenoura",
                    style: TypographyStyles.label3(),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
                const SizedBox(width: 20),
                Flexible(
                  child: RichText(
                    text: TextSpan(
                      text: "R\$2,99",
                      style: TypographyStyles.label3()
                          .copyWith(color: ThemeColors.black),
                      children: [
                        TextSpan(
                          text: " / kg",
                          style: TypographyStyles.paragraph4(),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const DottedLine(
              direction: Axis.horizontal,
              alignment: WrapAlignment.center,
              lineThickness: 1,
              dashLength: 12,
              dashGapLength: 12,
              dashColor: ThemeColors.gray6,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Quantidade", style: TypographyStyles.label3().copyWith(color: ThemeColors.gray4),),
                RichText(
                  text: TextSpan(
                    text: "2",
                    style: TypographyStyles.label3().copyWith(color: ThemeColors.black),
                    children: [
                      TextSpan(
                        text: " kg",
                        style: TypographyStyles.paragraph4(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Valor total", style: TypographyStyles.label3().copyWith(color: ThemeColors.gray4),),
                Text("R\$5,98", style: TypographyStyles.label3(),)
              ],
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ActionButton(isFilled: false, onTap: (){Navigator.pop(context);}, text: "Cancelar"),
                  ActionButton(isFilled: true, onTap: (){Navigator.pushNamed(context, "/runningStatus");}, text: "Confirmar")
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
