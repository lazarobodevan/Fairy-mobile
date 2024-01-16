import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile/shared/components/custom_label.dart';
import 'package:mobile/theme/theme_colors.dart';
import 'package:mobile/theme/typography_styles.dart';

class SvgCategoryTile extends StatelessWidget {
  final String label;
  final String iconPath;
  final Function() onTap;
  const SvgCategoryTile({super.key, required this.label, required this.onTap, required this.iconPath});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Ink(
          width: 65,
          height: 65,
          decoration: BoxDecoration(
            color: ThemeColors.gray1,
            borderRadius: BorderRadius.circular(65)
          ),
          child: InkWell(
            onTap: onTap,
            child: Center(
              child: SvgPicture.asset(iconPath, width: 38, height: 38,),
            ),
          ),
        ),
        Text(label, style: TypographyStyles.label4(),)
      ],
    );
  }
}
