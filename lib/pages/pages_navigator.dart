import 'package:flutter/material.dart';
import 'package:prog/assets/colors.dart';
import 'package:prog/components/lower_section.dart';
import 'package:prog/pages/home_page.dart';
import 'package:prog/pages/movie_page.dart';
import 'package:prog/pages/profile_page.dart';
import 'package:prog/pages/theatre_page.dart';

class pagesNavigator extends StatefulWidget {
  const pagesNavigator({super.key});

  @override
  State<pagesNavigator> createState() => _pagesNavigatorState();
}

class _pagesNavigatorState extends State<pagesNavigator> {
  int selectedIndex = 0;
  void navigateBottomBar(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    const homePage(),
    const moviePage(),
    const theatrePage(),
    const ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.myBackground,
      bottomNavigationBar: BottomNavBar(
        
        onTabChange: (index) => navigateBottomBar(index),
      ),
      body: _pages[selectedIndex],
    );
  }
}
