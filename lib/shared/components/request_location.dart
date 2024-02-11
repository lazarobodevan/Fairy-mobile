import 'package:flutter/material.dart';
import 'package:mobile/shared/blocs/geolocation/geolocation_bloc.dart';
import 'package:mobile/shared/components/action_button.dart';
import 'package:mobile/theme/typography_styles.dart';
import 'package:permission_handler/permission_handler.dart';

class RequestLocationWidget extends StatelessWidget {
  final GeolocationState state;

  const RequestLocationWidget({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: state is GeolocationPermissionErrorState
          ? Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Icon(
                Icons.location_on_outlined,
                size: 30,
              ),
              Text(
                "Puts... preciso da sua localização para trazer os resultados! :(",
                textAlign: TextAlign.center,
                style: TypographyStyles.paragraph3(),
              ),
              Text("Permita a localização! :)",
                  style: TypographyStyles.paragraph3()),
              const SizedBox(
                height: 10,
              ),
              ActionButton(
                  isFilled: true,
                  onTap: () {
                    openAppSettings();
                  },
                  text: "Permitir")
            ])
          : Padding(
              padding: EdgeInsets.all(20),
              child: Center(
                  child: Text("Opss... Não consegui obter sua localização :(",
                      style: TypographyStyles.paragraph3())),
            ),
    );
  }
}
