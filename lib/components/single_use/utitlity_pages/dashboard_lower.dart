import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:prog/assets/colors.dart';

class DashboardNavBar extends StatelessWidget {
  void Function(int)? onTabChange;
   DashboardNavBar({super.key, required this.onTabChange});

  // final Function(int) onTabTapped;
  // final int currentIndex;

  // BottomNavBar({required this.onTabTapped, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Container(
        child: GNav(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          color: AppColors.myAccent,
          activeColor: Colors.black,
          tabActiveBorder: Border.all(color: Colors.grey[300]!,),
          tabBackgroundColor: Colors.grey[300]!,
          tabBorderRadius: 16,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          onTabChange: (value) => onTabChange!(value),
          tabs: const [
            GButton(
              icon: Icons.schedule,
              text: "Schedules",
              
              textStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
              iconColor: Colors.black,
            ),
            GButton(
              icon: Icons.movie,
              text: "Movies",
              textStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.w600) ,
              ),
             
          ],
          
          
          
          ),
      ),
    );
  }
}
