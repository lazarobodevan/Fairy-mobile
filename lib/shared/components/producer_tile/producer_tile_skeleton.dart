import 'package:flutter/material.dart';
import 'package:mobile/theme/theme_colors.dart';
import 'package:shimmer/shimmer.dart';

class ProducerTileSkeleton extends StatelessWidget {
  const ProducerTileSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[400]!,
          child: Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: ThemeColors.gray2
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[400]!,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 180,
                height: 15,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: ThemeColors.gray2
                ),
              ),
              const SizedBox(height: 10,),
              Container(
                width: 70,
                height: 15,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: ThemeColors.gray2
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
