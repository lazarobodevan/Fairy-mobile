import 'package:flutter/material.dart';
import 'package:mobile/shared/components/custom_button.dart';

class ProducerHomeScreen extends StatelessWidget {
  const ProducerHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CustomButton(onTap: (){}, text: 'TEste',)),
    );
  }
}
