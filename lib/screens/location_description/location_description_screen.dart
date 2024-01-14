import 'package:flutter/material.dart';
import 'package:mobile/shared/components/custom_app_bar.dart';
import 'package:mobile/shared/components/custom_button.dart';
import 'package:mobile/shared/components/custom_label.dart';
import 'package:mobile/shared/components/custom_text_area.dart';
import 'package:mobile/shared/components/custom_text_field.dart';
import 'package:mobile/theme/typography_styles.dart';

class LocationDescriptionScreen extends StatelessWidget {
  const LocationDescriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Detalhes da Localização",
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextArea(),
            const SizedBox(
              height: 16,
            ),
            const CustomLabel(text: "Localização Selecionada"),
            CustomTextField(
              controller: TextEditingController(
                  text: "Rua das Andradas - 61 - "
                      "Belo Horizonte - MG"),
              isActive: false,
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: CustomButton(
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).pop();
                    },
                    text: "Salvar Endereço"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
