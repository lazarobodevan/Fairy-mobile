import 'package:flutter/material.dart';
import 'package:mobile/theme/theme_colors.dart';

class CustomDropdownButton extends StatefulWidget {
  const CustomDropdownButton({super.key});

  @override
  State<CustomDropdownButton> createState() => _CustomDropdownButtonState();
}

class _CustomDropdownButtonState extends State<CustomDropdownButton> {
  List options = ["1", "2", "3", "4", "5", "6"];
  String? chosenValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      decoration: BoxDecoration(
        border: Border.all(color: ThemeColors.primary3),
        borderRadius: BorderRadius.circular(6),
      ),
      child: ButtonTheme(
        alignedDropdown: true,
        child: DropdownButton(
          borderRadius: BorderRadius.circular(6),
          underline: SizedBox(),
          value: chosenValue,
          isExpanded: true,
          style: TextStyle(overflow: TextOverflow.ellipsis, color: ThemeColors.black),
          hint: Text(
            "Quantidade",
            overflow: TextOverflow.ellipsis,
          ),
          items: options
              .map((e) => DropdownMenuItem(
                    child: Text(e),
                    value: e,
                  ))
              .toList(),
          onChanged: (Object? newValue) {
            setState(
              () {
                chosenValue = newValue?.toString() ?? ""; // Converte para String
              },
            );
          },
        ),
      ),
    );
  }
}
