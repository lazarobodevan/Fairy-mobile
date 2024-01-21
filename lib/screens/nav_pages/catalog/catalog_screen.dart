import 'package:flutter/material.dart';
import 'package:mobile/screens/nav_pages/catalog/components/products_tab.dart';
import 'package:mobile/shared/components/custom_text_field.dart';
import 'package:mobile/shared/components/product_tile.dart';
import 'package:mobile/theme/theme_colors.dart';
import 'package:mobile/theme/typography_styles.dart';

class CatalogScreen extends StatefulWidget{
  const CatalogScreen({super.key});

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> with TickerProviderStateMixin{
  late final TabController _tabController;
  double appBarHeight = 150;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          physics: BouncingScrollPhysics(),
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                pinned: false,
                floating: true,
                automaticallyImplyLeading: false,
                expandedHeight: appBarHeight,
                elevation: 0,
                flexibleSpace: FlexibleSpaceBar(
                  background: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 25),
                          child: CustomTextField(controller: TextEditingController(), hintText: "Buscar...", prefixIcon: Icon(Icons.search),),
                        ),
                        TabBar(
                          controller: _tabController,
                          indicatorColor: ThemeColors.primary3,
                          labelColor: ThemeColors.primary3,
                          tabs: [
                            Text("Produtos", style: TypographyStyles.paragraph3()),
                            Text("Produtores", style: TypographyStyles.paragraph3()),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            controller: _tabController,
            children: [
              Padding(padding:EdgeInsets.fromLTRB(20,10,20,0),child: ProductsTab()),
              Container(child: Text("oi")),
            ],
          ),
        ),
      ),
    );
  }
}