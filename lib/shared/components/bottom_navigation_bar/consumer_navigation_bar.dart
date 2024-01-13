import 'package:flutter/material.dart';

class ConsumerNavigationBar extends StatefulWidget {
  const ConsumerNavigationBar({super.key});

  @override
  State<ConsumerNavigationBar> createState() => _ConsumerNavigationBarState();
}

class _ConsumerNavigationBarState extends State<ConsumerNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(items: const[
      BottomNavigationBarItem(icon: Icon(Icons.home)),
      BottomNavigationBarItem(icon: Icon(Icons.home))
    ]);
  }
}
