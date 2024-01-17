import 'package:flutter/material.dart';
import 'package:mobile/screens/nav_pages/catalog/catalog_screen.dart';
import 'package:mobile/screens/nav_pages/home/home_screen.dart';
import 'package:mobile/screens/nav_pages/more/more_screen.dart';
import 'package:mobile/screens/nav_pages/orders/orders_screen.dart';
import 'package:mobile/shared/components/bottom_navigation_bar/custom_bottom_navigation_bar.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  List pages = [HomeScreen(), CatalogScreen(), OrdersScreen(), MoreScreen()];
  List barItems = [
    {"text": "Home", "icon": Icons.home_outlined},
    {"text": "Catálogo", "icon": Icons.map_outlined},
    {"text": "Pedidos", "icon": Icons.handshake_outlined},
    {"text": "Mais", "icon": Icons.more_vert}
  ];

  void _onIndexChanged(int newIndex) {
    setState(() {
      currentIndex = newIndex;
    });
  }


  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: CustomBottomNavigationBar(
        barItems: barItems,
        currentIndex: currentIndex,
        pages: pages,
        onIndexChanged: _onIndexChanged
      ),
    );
  }
}
