import 'package:flutter/material.dart';
import 'package:mobile/screens/nav_pages/home/home_screen.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  State<CustomBottomNavigationBar> createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  List consumerPages = [HomeScreen()];
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(items:[
      BottomNavigationBarItem(icon: Icon(Icons.home))
    ] 
    );
  }
}
