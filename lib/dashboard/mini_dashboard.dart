import 'package:flutter/material.dart';
import 'package:prog/assets/colors.dart';
import 'package:prog/components/single_use/utitlity_pages/dashboard_lower.dart';
import 'package:prog/pages/testing/add_schedules.dart';
import 'package:prog/pages/testing/test_db.dart';


class MiniDashboard extends StatefulWidget {
  const MiniDashboard({super.key});

  @override
  State<MiniDashboard> createState() => _MiniDashboardState();
}

class _MiniDashboardState extends State<MiniDashboard> {
  int selectedIndex = 0;
  void navigateBottomBar(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    AddSchedules(),
    TestDb()    
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.myBackground,
      bottomNavigationBar: DashboardNavBar(
        
        onTabChange: (index) => navigateBottomBar(index),
      ),
      body: _pages[selectedIndex],
    );
  }
}
