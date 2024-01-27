import 'package:flutter/material.dart';
import 'package:mobile/screens/nav_pages/catalog/components/producers_tab.dart';
import 'package:mobile/screens/nav_pages/catalog/components/products_tab.dart';
import 'package:mobile/shared/components/custom_text_field.dart';
import 'package:mobile/shared/components/filter_chips_list.dart';
import 'package:mobile/shared/components/product_card.dart';
import 'package:mobile/theme/theme_colors.dart';
import 'package:mobile/theme/typography_styles.dart';

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({super.key});

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                      tabs: [
                        Text("Produtos", style: TypographyStyles.paragraph3()),
                        Text("Produtores",
                            style: TypographyStyles.paragraph3()),
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
              children: [ProductsTab(), ProducersTab()],
            ),
          ),
        ],
      ),
    );
  }
}
