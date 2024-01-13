import 'package:dynamic_stepper/dynamic_stepper.dart';
import 'package:flutter/material.dart';
import 'package:mobile/shared/Enums/user_type.dart';
import 'package:mobile/shared/components/custom_button.dart';
import 'package:mobile/shared/components/custom_link.dart';
import 'package:mobile/shared/components/text_field.dart';
import 'package:mobile/theme/theme_colors.dart';
import 'package:mobile/theme/typography_styles.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  int currentStep = 0;
  UserType selectedUserType = UserType.PRODUCER;
  bool isTermsAndConditionsAccepted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 120, 20, 0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: 245,
                child: Column(
                  children: [
                    Text(
                      "Criar uma Conta",
                      style: TypographyStyles.headline2(),
                    ),
                    Text(
                      "Preencha as informações abaixo para efetuar seu cadastro",
                      style: TypographyStyles.label3().copyWith(
                        color: ThemeColors.gray4,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Theme(
                data: Theme.of(context).copyWith(
                    colorScheme:
                        ColorScheme.light(primary: ThemeColors.primary3)),
                child: DynamicStepper(
                  onStepContinue: () {
                    setState(() {
                      if (selectedUserType == UserType.PRODUCER && currentStep != 3) {
                        currentStep++;
                      }
                      if(selectedUserType == UserType.CONSUMER && currentStep != 2){
                        currentStep++;
                      }
                    });
                  },
                  onStepTapped: (int newIndex) {
                    setState(() {
                      currentStep = newIndex;
                    });
                  },
                  currentStep: currentStep,
                  steps: [
                    DynamicStep(
                      title: Text("Dados de login"),
                      isActive: currentStep == 0,
                      content: Column(
                        children: [
                          const SizedBox(
                            height: 5,
                          ),
                          CustomTextField(
                            hintText: "Maria da Silva",
                            controller: TextEditingController(),
                            label: "Nome completo",
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          CustomTextField(
                            controller: TextEditingController(),
                            hintText: "exemplo@gmail.com",
                            label: "Email",
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          CustomTextField(
                            controller: TextEditingController(),
                            hintText: "**********",
                            label: "Senha",
                            isShowSuffixIcon: true,
                            isObscureText: true,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          CustomTextField(
                            controller: TextEditingController(),
                            hintText: "**********",
                            label: "Confirmar Senha",
                            isShowSuffixIcon: true,
                            isObscureText: true,
                          ),
                        ],
                      ),
                    ),

                    //Usuario
                    DynamicStep(
                        title: Text("Usuário"),
                        isActive: currentStep == 1,
                        content: Column(
                          children: [
                            InkWell(
                              borderRadius: BorderRadius.circular(20),
                              onTap: () {
                                setState(() {
                                  selectedUserType = UserType.PRODUCER;
                                });
                              },
                              child: Row(
                                children: [
                                  Radio(
                                    value: UserType.PRODUCER,
                                    groupValue: selectedUserType,
                                    onChanged: (UserType? value) {
                                      setState(() {
                                        selectedUserType = value!;
                                      });
                                    },
                                  ),
                                  Text("Produtor(a)")
                                ],
                              ),
                            ),
                            InkWell(
                              borderRadius: BorderRadius.circular(20),
                              onTap: () {
                                setState(() {
                                  selectedUserType = UserType.CONSUMER;
                                });
                              },
                              child: Row(
                                children: [
                                  Radio(
                                    value: UserType.CONSUMER,
                                    groupValue: selectedUserType,
                                    onChanged: (UserType? value) {
                                      setState(() {
                                        selectedUserType = value!;
                                      });
                                    },
                                  ),
                                  Text("Consumidor(a)")
                                ],
                              ),
                            )
                          ],
                        )),

                    //Localizacao
                    if (selectedUserType == UserType.PRODUCER)
                      DynamicStep(
                        title: Text("Localização"),
                        isActive: currentStep == 2,
                        content: const Column(
                          children: [
                            Text(
                                "Para que as pessoas possam te encontrar, é preciso que diga onde você atende. "
                                "Evite colocar o endereço residencial, e prefira ambientes públicos."),
                            Row(
                              children: [
                                Icon(
                                  Icons.info_outline,
                                  color: Colors.blue,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),

                    DynamicStep(
                      title: Text("Termos e Condições"),
                      isActive: selectedUserType == UserType.PRODUCER ? currentStep == 3 : currentStep == 2,
                      content: Row(
                        children: [
                          Checkbox(
                            value: isTermsAndConditionsAccepted,
                            onChanged: (value) {
                              setState(() {
                                isTermsAndConditionsAccepted =
                                    !isTermsAndConditionsAccepted;
                              });
                            },
                          ),
                          Text("Aceito os "),
                          CustomLink(text: "Termos e Condições", onTap: () {}),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40,),
              Align(
                alignment: Alignment.bottomCenter,
                child: CustomButton(isActive: isTermsAndConditionsAccepted,text: "Cadastrar",onTap: (){}),
              )
            ],
          ),
        ),
      ),
    );
  }
}
