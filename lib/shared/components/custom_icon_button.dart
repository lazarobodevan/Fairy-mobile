import 'package:flutter/material.dart';
import 'package:mobile/theme/theme_colors.dart';
import 'package:mobile/theme/typography_styles.dart';

class CustomIconButton extends StatelessWidget {
  final Function() onTap;
  const CustomIconButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: onTap,
        child: Ink(
          width: 150,
          height: 40,
          decoration: BoxDecoration(
            color: ThemeColors.primary3,
            borderRadius: BorderRadius.circular(6)
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.shopping_cart_checkout_outlined,
                  color: ThemeColors.white,
                ),
                const SizedBox(width: 5,),
                Flexible(
                  child: Text(
                    "Encomendar",
                    style: TypographyStyles.paragraph3().copyWith(color: ThemeColors.white),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
