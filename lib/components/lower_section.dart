import 'package:flutter/material.dart';
import 'package:prog/assets/colors.dart';

class BottomNavBar extends StatelessWidget {
  // final Function(int) onTabTapped;
  // final int currentIndex;

  // BottomNavBar({required this.onTabTapped, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColors.myBackground,
      unselectedItemColor: Colors.white, 
       selectedItemColor: Colors.white,
       iconSize: 30.0,
      // currentIndex: currentIndex,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: ''
        
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: ''
       
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: ''
          
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.location_on),
          label: ''
          
        ),
      ],
    
    );
  }
}