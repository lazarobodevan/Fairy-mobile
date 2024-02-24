import 'package:flutter/material.dart';
import 'package:mobile/screens/nav_pages/catalog/components/products_tab.dart';
import 'package:mobile/shared/components/custom_icon_button.dart';
import 'package:mobile/shared/components/rating_card/rating_card.dart';
import 'package:mobile/theme/theme_colors.dart';
import 'package:mobile/theme/typography_styles.dart';

class ProducerDetailsScreen extends StatefulWidget {
  final String producerId;

  const ProducerDetailsScreen({super.key, required this.producerId});

  @override
  State<ProducerDetailsScreen> createState() => _ProducerDetailsScreenState();
}

class _ProducerDetailsScreenState extends State<ProducerDetailsScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    _tabController = TabController(length: 1, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 200,
              pinned: true,
              surfaceTintColor: Colors.white,
              leading: Container(
                width: 24,
                height: 24,
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  borderRadius: BorderRadius.circular(40),
                  child: Center(
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        border: Border.all(color: ThemeColors.gray6),
                        borderRadius:
                        const BorderRadius.all(Radius.circular(40)),
                        color: Colors.white,
                      ),
                      child: const Icon(Icons.arrow_back),
                    ),
                  ),
                ),
              ),
              flexibleSpace: FlexibleSpaceBar(background: Header(context)),
            ),
            SliverPadding(
              padding: EdgeInsets.only(bottom: 5, right: 20, top: 20, left: 20),
              sliver: SliverToBoxAdapter(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Sobre",
                      style: TypographyStyles.label1(),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      width: double.maxFinite,
                      height: 100,
                      decoration: BoxDecoration(
                        color: ThemeColors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: ThemeColors.black.withOpacity(.25),
                            blurRadius: 4,
                            offset: const Offset(0, 3),
                          )
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          "Lorem ipsum dolor sit amet consectetur. Tristique volutpat arcu ultricies eget gravida eleifend ipsum elit faucibus. Sagittis orci purus congue non aenean. Dignissim iaculis sit vitae enim dignissim ut imperdiet lacus",
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                          style: TypographyStyles.paragraph3(),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomIconButton(
                      onTap: () {},
                      text: "Conversar",
                      icon: Icons.phone,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Avaliaçõoes",
                          style: TypographyStyles.label1(),
                        ),
                        Text("Ver todos", style: TypographyStyles.label3().copyWith(color: ThemeColors.primary3),)
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Container(
                    height: 160,
                    child: ListView.separated(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      controller: ScrollController(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return RatingCard();
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          width: 10,
                        );
                      },
                      itemCount: 4,
                    ),
                  ),
                ],
              ),
            ),
            SliverPersistentHeader(delegate: MySliverHeader(expandedHeight: 90, tabController: _tabController), pinned: true,floating: false,)
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: [
            GridView.builder(
              physics: AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.only(
                  top: 20, left: 20, right: 20, bottom: 40),
              itemCount: 20,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  color: Colors.blue[100 * (index % 9)],
                  child: Center(
                    child: Text('Item $index'),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget Header(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 200,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8), color: Colors.green),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset("assets/images/vegetables.png",
                  fit: BoxFit.cover, alignment: Alignment.center)),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            gradient: const LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color.fromRGBO(30, 30, 30, .8),
                Color.fromRGBO(30, 30, 30, .20)
              ],
            ),
          ),
        ),
        Positioned(
          top: 110,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(90),
                      boxShadow: [
                        BoxShadow(
                          color: ThemeColors.black.withOpacity(.25),
                          blurRadius: 4,
                          offset: const Offset(0, 3),
                        )
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(90),
                      child: Image.asset(
                        "assets/images/vegetables.png",
                        width: 90,
                        height: 90,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Sebastião da Silva",
                      style: TypographyStyles.headline3()
                          .copyWith(color: ThemeColors.white),
                    ),
                    Text(
                      "Belo Horizonte - MG",
                      style: TypographyStyles.label1()
                          .copyWith(color: ThemeColors.white),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: ThemeColors.accepted,
                        ),
                        Text(
                          "4,75/5",
                          style: TypographyStyles.label3()
                              .copyWith(color: ThemeColors.white),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class MySliverHeader extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final TabController tabController;

  MySliverHeader({required this.expandedHeight, required this.tabController});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return
       SizedBox.expand(
         child: Align(
           alignment: Alignment.topLeft,
           child: Container(
             color: Colors.white,
             child: TabBar(
              controller: tabController,
              isScrollable: true,
              tabAlignment: TabAlignment.start,
              labelColor: ThemeColors.primary3,
              indicatorColor: ThemeColors.primary3,
              labelStyle: TypographyStyles.paragraph2(),
              tabs: [
                Tab(text: 'Todos'),
              ],
                   ),
           ),
         ),
       );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => maxExtent;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
