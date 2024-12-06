// settings_page.dart

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:prog/assets/colors.dart';
import 'package:prog/assets/fonts.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.myBackground,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: Padding(
          padding: EdgeInsets.only(top: 20),
          child: AppBar(
            iconTheme: IconThemeData(color: Colors.white),
            title: Text(
              'Settings',
              style: TextStyle(
                fontFamily: AppFonts.mainFont,
                fontWeight: FontWeight.w700,
                letterSpacing: sqrt2, // that's looks just kinda cool
                color: Colors.white,
              ),
            ),
            backgroundColor: AppColors.myBackground,
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          ListTile(
            leading: Icon(Icons.account_circle_outlined, color: Colors.white),
            title: Text(
              'Account Settings',
              style: TextStyle(
                fontFamily: AppFonts.mainFont,
                color: Colors.white,
              ),
            ),
            onTap: () {
              // Navigate to Account Settings
            },
          ),
          Divider(color: Colors.grey),
          ListTile(
            leading: Icon(Icons.notifications_none, color: Colors.white),
            title: Text(
              'Notification Settings',
              style: TextStyle(
                fontFamily: AppFonts.mainFont,
                color: Colors.white,
              ),
            ),
            onTap: () {
              // Navigate to Notification Settings
            },
          ),
          Divider(color: Colors.grey),
          ListTile(
            leading: Icon(Icons.palette_outlined, color: Colors.white),
            title: Text(
              'Theme',
              style: TextStyle(
                fontFamily: AppFonts.mainFont,
                color: Colors.white,
              ),
            ),
            onTap: () {
              // Navigate to Theme Settings
            },
          ),
        ],
      ),
    );
  }
}