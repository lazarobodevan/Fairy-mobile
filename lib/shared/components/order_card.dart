import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/shared/components/action_button.dart';
import 'package:mobile/theme/theme_colors.dart';
import 'package:mobile/theme/typography_styles.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190,
      decoration: BoxDecoration(
        color: ThemeColors.white,
        boxShadow: [
          BoxShadow(
              color: ThemeColors.black.withOpacity(.25),
              blurRadius: 4,
              offset: const Offset(0, 3))
        ],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 1,
                  child: Container(
                    width: 90,
                    height: 25,
                    decoration: BoxDecoration(
                        color: ThemeColors.pending,
                        borderRadius: BorderRadius.circular(15)),
                    child: Center(
                      child: Text(
                        "Pendente",
                        style: TypographyStyles.paragraph4().copyWith(
                          color: const Color(0xFF2845AC),
                        ),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Text(
                    "Cenoura laranja - orgânico e bonito",
                    overflow: TextOverflow.ellipsis,
                    style: TypographyStyles.label3(),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Text(
                    "2kg",
                    style: TypographyStyles.paragraph4(),
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(10,20,10,10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("ID do pedido", style: TypographyStyles.paragraph4().copyWith(color: ThemeColors.gray6),),
                    const SizedBox(height: 5,),
                    Text("#ABC12D345EF", style: TypographyStyles.paragraph4(),)
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Data do pedido", style: TypographyStyles.paragraph4().copyWith(color: ThemeColors.gray6),),
                    const SizedBox(height: 5,),
                    Text("17, Janeiro, 24", style: TypographyStyles.paragraph4(),)
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Valor total", style: TypographyStyles.paragraph4().copyWith(color: ThemeColors.gray6),),
                    const SizedBox(height: 5,),
                    Text("R\$5,96", style: TypographyStyles.paragraph4(),)
                  ],
                )
              ],
            ),
          ),
          Divider(),
          Material(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10,10,10,0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                ActionButton(isFilled: false, onTap: (){}, text: "Cancelar"),
                ActionButton(isFilled: true, onTap: (){}, text: "Ver detalhes"),
              ],),
            ),
          )
        ],
      ),
    );
  }
}
