import 'package:flutter/material.dart';
import 'package:mobile/theme/theme_colors.dart';
import 'package:mobile/theme/typography_styles.dart';

class DistanceSlider extends StatefulWidget {
  const DistanceSlider({super.key});

  @override
  State<DistanceSlider> createState() => _DistanceSliderState();
}

class _DistanceSliderState extends State<DistanceSlider> {
  int currentValue = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("1Km"),
            Text("100Km"),
          ],
        ),
        Slider(
          value: currentValue.toDouble(),
          max: 100,
          min: 1,
          inactiveColor: ThemeColors.primary2,
          activeColor: ThemeColors.primary3,
          label: currentValue.toString(),
          divisions: 100,
          onChanged: (value) {
            setState(
              () {
                currentValue = value.toInt();
              },
            );
          },
        ),
        Center(
          child: Text(
            "${currentValue.toString()} Km",
            style: TypographyStyles.label3(),
          ),
        )
      ],
    );
  }
}
