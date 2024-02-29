import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/screens/nav_pages/catalog/components/products_tab.dart';
import 'package:mobile/screens/producer_details_screen/bloc/producer_details_bloc.dart';
import 'package:mobile/services/producer_service.dart';
import 'package:mobile/services/product_service.dart';
import 'package:mobile/shared/components/custom_icon_button.dart';
import 'package:mobile/shared/components/product_card/product_card.dart';
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
    return BlocProvider(
      create: (context) => ProducerDetailsBloc(
        producerService: RepositoryProvider.of<ProducerService>(context),
      )..add(LoadProducerDetailsEvent(producerId: widget.producerId)),
      child: Scaffold(
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
                padding:
                    EdgeInsets.only(bottom: 5, right: 20, top: 20, left: 20),
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
                          child: BlocBuilder<ProducerDetailsBloc,
                              ProducerDetailsState>(
                            builder: (context, state) {
                              if (state is ProducerDetailsLoadedState) {
                                var producer =
                                    state.producerProductsRequest.producer;
                                return Text(
                                  producer.whereToFind,
                                  maxLines: 4,
                                  overflow: TextOverflow.ellipsis,
                                  style: TypographyStyles.paragraph3(),
                                );
                              }
                              return Text("Ooops... :(");
                            },
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
                          Text(
                            "Ver todos",
                            style: TypographyStyles.label3()
                                .copyWith(color: ThemeColors.primary3),
                          )
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
              SliverPersistentHeader(
                delegate: MySliverHeader(
                    expandedHeight: 90, tabController: _tabController),
                pinned: true,
                floating: false,
              )
            ];
          },
          body: BlocBuilder<ProducerDetailsBloc, ProducerDetailsState>(
            builder: (context, state) {
              if (state is ProducerDetailsLoadedState) {
                var products = state.producerProductsRequest.products.data;
                return TabBarView(
                  controller: _tabController,
                  children: [
                    getTab(context)
                  ],
                );
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget getTab(BuildContext context){
    return BlocBuilder<ProducerDetailsBloc, ProducerDetailsState>(
      builder: (context, state){
        if(state is ProducerDetailsLoadedState){
          var products = state.producerProductsRequest.products.data;
          if(products.isNotEmpty){
            return GridView.builder(
              physics: AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.only(
                  top: 20, left: 20, right: 20, bottom: 40),

              itemCount: products.length,
              gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                childAspectRatio: 0.8
              ),
              itemBuilder: (BuildContext context, int index) {
                return ProductCard(product: products[index]);
              },
            );
          }
          return Center(child: Text("Nada por aqui..."),);
        }
        return Center(child: CircularProgressIndicator(),);
      },
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
        BlocBuilder<ProducerDetailsBloc, ProducerDetailsState>(
          builder: (context, state) {
            if (state is ProducerDetailsLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is ProducerDetailsLoadedState) {
              var producer = state.producerProductsRequest.producer;
              return Positioned(
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
                            child: producer.picture != null
                                ? Image.network(
                                    producer.picture!,
                                    width: 90,
                                    height: 90,
                                    fit: BoxFit.cover,
                                  )
                                : const SizedBox(
                                    child: Icon(
                                      Icons.person,
                                      size: 45,
                                    ),
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
                          SizedBox(
                            width: MediaQuery.of(context).size.width - 170,
                            child: Text(
                              producer.name,
                              style: TypographyStyles.headline3()
                                  .copyWith(color: ThemeColors.white),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width - 170,
                            child: Text(
                              "${producer.location.city} - ${producer.location.state}",
                              style: TypographyStyles.label1()
                                  .copyWith(color: ThemeColors.white),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: ThemeColors.accepted,
                              ),
                              Text(
                                "${producer.ratingsAvg}/5   (${producer.ratingsCount})",
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
              );
            }
            return SizedBox(
              child: Center(
                child: Text("Deu ruim"),
              ),
            );
          },
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
    return SizedBox.expand(
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
