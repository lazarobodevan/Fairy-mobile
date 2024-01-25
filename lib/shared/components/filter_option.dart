import 'package:flutter/material.dart';
import 'package:mobile/theme/theme_colors.dart';
import 'package:mobile/theme/typography_styles.dart';

class FilterOption extends StatefulWidget {
  bool isSelected;
  final IconData icon;
  final String label;
  final Function() onTap;
  FilterOption({super.key, this.isSelected = false, required this.icon, required this.label, required this.onTap});

  @override
  State<FilterOption> createState() => _FilterOptionState();
}

class _FilterOptionState extends State<FilterOption> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap: widget.onTap,
          borderRadius: BorderRadius.circular(80),
          child: Ink(
            width: 84,
            height: 84,
            decoration: BoxDecoration(
              border: widget.isSelected ? null : Border.all(color: ThemeColors.gray4),
              borderRadius: BorderRadius.circular(80),
              color: widget.isSelected ? ThemeColors.gray3 : ThemeColors.white,
            ),
            child: Center(
              child: Icon(widget.icon, color: widget.isSelected ? ThemeColors.primary3 : ThemeColors.gray6, size: 40,),
            ),
          ),
        ),
        Center(child: Text(widget.label, style: TypographyStyles.label3().copyWith(color: widget.isSelected ? ThemeColors.primary3 : ThemeColors.gray6),textAlign: TextAlign.center,))
      ],
    );
  }
}
