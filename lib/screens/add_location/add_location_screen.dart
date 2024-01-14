import 'package:flutter/material.dart';
import 'package:mobile/screens/add_location/components/location_item.dart';
import 'package:mobile/shared/components/custom_app_bar.dart';
import 'package:mobile/shared/components/custom_text_field.dart';
import 'package:mobile/theme/theme_colors.dart';
import 'package:mobile/theme/typography_styles.dart';

class AddLocationScreen extends StatelessWidget {
  const AddLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var locations = [
      LocationItem(),
      LocationItem(),
      LocationItem(),
    ];
    return Scaffold(
      appBar: CustomAppBar(title: "Adicionar Localização",),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 25, 20, 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextField(
              controller: TextEditingController(),
              hintText: "Rua das Andradas, 61, Belo Horizonte...",
              prefixIcon: const Icon(
                Icons.search,
                color: ThemeColors.primary3,
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(6),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: Row(
                  children: [
                    const Icon(
                      Icons.location_on,
                      color: ThemeColors.primary3,
                    ),
                    Text(
                      "Usar minha localização atual",
                      style: TypographyStyles.label4(),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            const Divider(
              height: 1,
              color: ThemeColors.gray3,
            ),
            const SizedBox(
              height: 14,
            ),
            Text(
              "RESULTADOS DA BUSCA",
              style:
                  TypographyStyles.label4().copyWith(color: ThemeColors.gray6),
            ),
            const SizedBox(
              height: 16,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: locations.length,
                itemBuilder: (context, index) {
                  return Padding(
                      padding: const EdgeInsets.only(bottom: 25),
                      child: locations[index]);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
