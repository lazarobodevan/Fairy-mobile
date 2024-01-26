import 'package:flutter/material.dart';
import 'package:mobile/models/rounded_filter_option_model.dart';
import 'package:mobile/shared/components/filter_option.dart';
import 'package:mobile/theme/theme_colors.dart';
import 'package:mobile/theme/typography_styles.dart';

class FilterOptions extends StatefulWidget {
  final List<RoundedFilterOptionModel>? filterOptions;
  final String title;
  final Widget? customWidget;
  final bool isCustomWidget;
  int selectedOptionIndex;

  FilterOptions(
      {super.key,
      this.filterOptions,
      this.selectedOptionIndex = 0,
      this.isCustomWidget = false,
      this.customWidget,
      required this.title});

  @override
  State<FilterOptions> createState() => _FilterOptionsState();
}

class _FilterOptionsState extends State<FilterOptions> {
  void handleSelectedFilterOption(int currentIndex) {
    if (currentIndex == widget.selectedOptionIndex) return;
    setState(() {
      widget.filterOptions![widget.selectedOptionIndex].isSelected = false;
      widget.filterOptions![currentIndex].isSelected = true;
      widget.selectedOptionIndex = currentIndex;
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Container(
              width: 60,
              height: 10,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: ThemeColors.gray6),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              widget.title,
              style: TypographyStyles.label2(),
            ),
            const SizedBox(
              height: 20,
            ),
            widget.isCustomWidget
                ? widget.customWidget!
                : Expanded(
                    child: GridView.count(
                      crossAxisCount: 3,
                      shrinkWrap: true,
                      children: widget.filterOptions!.asMap().entries.map(
                        (element) {
                          final index = element.key;
                          final option = element.value;
                          return FilterOption(
                            icon: option.icon,
                            label: option.label,
                            isSelected: option.isSelected,
                            onTap: () => handleSelectedFilterOption(index),
                          );
                        },
                      ).toList(),
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
