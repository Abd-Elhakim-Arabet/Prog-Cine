import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:prog/assets/colors.dart';

class BottomNavBar extends StatelessWidget {
  void Function(int)? onTabChange;
   BottomNavBar({super.key, required this.onTabChange});

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
          activeColor: AppColors.myPrimary,
          tabActiveBorder: Border.all(color: AppColors.myAccent,),
          tabBackgroundColor: AppColors.myAccent,
          tabBorderRadius: 16,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          onTabChange: (value) => onTabChange!(value),
          tabs: const [
            GButton(icon: Icons.home,
              text: "Home",
            ),
            GButton(
              icon: Icons.movie,
              text: "Movies",
              ),
              GButton(
                icon: Icons.theaters,
                text: "Theatres",
                ),
                GButton(
                  icon: Icons.person,
                  text: "Profile",
                  ),
          ],
          
          
          
          ),
      ),
    );
  }
}
