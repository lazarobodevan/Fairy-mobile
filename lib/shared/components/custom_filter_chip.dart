import 'package:flutter/material.dart';
import 'package:mobile/theme/theme_colors.dart';
import 'package:mobile/theme/typography_styles.dart';

class CustomFilterChip extends StatefulWidget {
  final bool isSelected;
  final IconData icon;
  final String text;
  final Function() onSelected;

  const CustomFilterChip(
      {super.key,
      this.isSelected = false,
      required this.onSelected,
      required this.icon,
      required this.text});

  @override
  State<CustomFilterChip> createState() => _CustomFilterChipState();
}

class _CustomFilterChipState extends State<CustomFilterChip> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: widget.onSelected,
        borderRadius: BorderRadius.circular(40),
        child: Ink(
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                border: Border.all(
                    color: widget.isSelected
                        ? ThemeColors.primary4
                        : ThemeColors.gray4),
                borderRadius: BorderRadius.circular(40)),
            child: Row(
              children: [
                Text(
                  widget.text,
                  style: TypographyStyles.paragraph4().copyWith(
                      color: widget.isSelected
                          ? ThemeColors.primary4
                          : ThemeColors.gray6),
                ),
                const SizedBox(
                  width: 5,
                ),
                Icon(
                  widget.icon,
                  color: widget.isSelected
                      ? ThemeColors.primary3
                      : ThemeColors.gray4,
                ),
              ],
            )),
      ),
    );
  }
}
