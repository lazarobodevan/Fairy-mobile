import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mobile/shared/components/custom_button.dart';
import 'package:mobile/theme/theme_colors.dart';
import 'package:mobile/theme/typography_styles.dart';

class RunningStatusScreen extends StatefulWidget {
  const RunningStatusScreen({super.key});

  @override
  State<RunningStatusScreen> createState() => _RunningStatusScreenState();
}

class _RunningStatusScreenState extends State<RunningStatusScreen> {
  bool isSuccess = true;
  bool isLoading = true;

  Future<void> mockRequest() async {
    Future.delayed(Duration(seconds: 5), () {
      isLoading = false;
      setState(() {});
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mockRequest();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20,0,20,40),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 120,
                      child: isLoading
                          ? OverflowBox(
                        minHeight: 180,
                        maxHeight: 180,
                        child: Center(
                          child: LottieBuilder.asset("assets/lotties/plane.json"),
                        ),
                      )
                          : LottieBuilder.asset(
                        "assets/lotties/success.json",
                        repeat: false,
                      ),
                    ),
                    isLoading
                        ? Text(
                      "Enviando solicitação...",
                      style: TypographyStyles.headline3(),
                    )
                        : Column(
                      children: [
                        Text(
                          "Encomenda realizada com sucesso!",
                          style: TypographyStyles.headline3(),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 10,),
                        RichText(
                          text: TextSpan(
                              text:
                              "Acompanhe o status da sua encomenda na página de ",
                              style: TypographyStyles.paragraph2()
                                  .copyWith(color: Colors.black),
                              children: [
                                TextSpan(
                                    text: "Pedidos",
                                    style: TypographyStyles.paragraph2()
                                        .copyWith(color: ThemeColors.primary3))
                              ]),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ],
                ),
              ),
              CustomButton(onTap: () {}, text: "Ver encomenda"),
            ],
          ),
        ),
      ),
    );
  }
}
