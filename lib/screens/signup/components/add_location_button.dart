import 'package:flutter/material.dart';
import 'package:mobile/theme/theme_colors.dart';
import 'package:mobile/theme/typography_styles.dart';

class AddLocationButton extends StatelessWidget {

  final String text;
  final Function() onTap;

  const AddLocationButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 170,
        height: 33,
        decoration: const BoxDecoration(
          color: ThemeColors.primary2
        ),
        child: Center(
          child: Text(text, style: TypographyStyles.label4().copyWith(color: ThemeColors.primary6),),
        ),
      ),
    );
  }
}
