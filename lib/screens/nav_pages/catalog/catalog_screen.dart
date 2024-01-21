import 'package:flutter/material.dart';
import 'package:mobile/screens/nav_pages/catalog/components/products_tab.dart';
import 'package:mobile/shared/components/custom_text_field.dart';
import 'package:mobile/theme/theme_colors.dart';
import 'package:mobile/theme/typography_styles.dart';

class CatalogScreen extends StatefulWidget{
  const CatalogScreen({super.key});

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> with TickerProviderStateMixin{
  late final TabController _tabController;
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
      appBar: AppBar(automaticallyImplyLeading: false),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextField(
              controller: TextEditingController(),
              prefixIcon: Icon(Icons.search),
              hintText: "Buscar...",
            ),
            const SizedBox(height: 25,),
            TabBar(
              controller: _tabController,
              indicatorColor: ThemeColors.primary3,
              labelColor: ThemeColors.primary3,

              tabs: [
                Text("Produtos", style: TypographyStyles.paragraph3(),),
                Text("Produtores", style: TypographyStyles.paragraph3(),),
              ],
            ),
            const SizedBox(height: 20,),
            Expanded(
              child: TabBarView(controller: _tabController,children: [
                ProductsTab(),
                Center(child: Text("tchau"))
              ]),
            )
          ],
        ),
      ),
    );
  }
}
