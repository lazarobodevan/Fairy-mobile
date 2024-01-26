import 'package:flutter/material.dart';
import 'package:mobile/screens/nav_pages/orders/components/orders_tab.dart';
import 'package:mobile/shared/components/custom_app_bar.dart';
import 'package:mobile/shared/components/custom_text_field.dart';
import 'package:mobile/theme/theme_colors.dart';
import 'package:mobile/theme/typography_styles.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.white,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Column(
                children: [
                  CustomTextField(
                    controller: TextEditingController(),
                    hintText: "Buscar...",
                    prefixIcon: const Icon(
                      Icons.search,
                    ),
                  ),
                  const SizedBox(height: 20,),
                  TabBar(
                    controller: _tabController,
                    indicatorColor: ThemeColors.primary3,
                    labelColor: ThemeColors.primary3,
                    isScrollable: true,
                    tabAlignment: TabAlignment.start,
                    tabs: [
                      Tab(child: Text("Pendentes", style: TypographyStyles.paragraph3())),
                      Tab(
                        child: Text("Aceitos",
                            style: TypographyStyles.paragraph3()),
                      ),
                      Tab(
                        child: Text("Concluídos",
                            style: TypographyStyles.paragraph3()),
                      ),
                      Tab(
                        child: Text("Rejeitados",
                            style: TypographyStyles.paragraph3()),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [OrdersTab(), Container(), Container(), Container()],
          ),
        ),
      ],
    );
  }
}
