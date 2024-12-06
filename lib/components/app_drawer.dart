import 'package:flutter/material.dart';
import 'package:prog/assets/colors.dart';

class appDrawer extends StatelessWidget {
  const appDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return  Drawer(
      child: Container(
        color: AppColors.myBackground,
        child: ListView(
          children: const [
            DrawerHeader(child: Center(
              child: Text("L O G O", style: TextStyle(
                fontSize: 30,
                color: AppColors.myAccent,
                fontWeight: FontWeight.w700
               ,),
              ))),

              ListTile(
                leading: Icon(Icons.home, color: AppColors.myAccent,),
                title: Text("Home", style: TextStyle(
                  fontSize: 20,
                  color: AppColors.myAccent,
                  fontWeight: FontWeight.w500
                ),),
              )
          ],
        ),
      ),
    );
  }
}