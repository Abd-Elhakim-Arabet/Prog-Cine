// help_support_page.dart

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:prog/assets/colors.dart';
import 'package:prog/assets/fonts.dart';

class HelpSupportPage extends StatelessWidget {
  const HelpSupportPage({super.key});

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
              'Help and Support',
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
            leading: Icon(Icons.question_answer, color: Colors.white),
            title: Text(
              'FAQ',
              style: TextStyle(
                fontFamily: AppFonts.mainFont,
                color: Colors.white,
              ),
            ),
            onTap: () {
              // Navigate to FAQ
            },
          ),
          Divider(color: Colors.grey),
          ListTile(
            leading: Icon(Icons.mail_outline, color: Colors.white),
            title: Text(
              'Contact Us',
              style: TextStyle(
                fontFamily: AppFonts.mainFont,
                color: Colors.white,
              ),
            ),
            onTap: () {
              // Implement contact us functionality
            },
          ),
          Divider(color: Colors.grey),
          ListTile(
            leading: Icon(Icons.info_outline, color: Colors.white),
            title: Text(
              'Terms and Conditions',
              style: TextStyle(
                fontFamily: AppFonts.mainFont,
                color: Colors.white,
              ),
            ),
            onTap: () {
              // Navigate to Terms and Conditions
            },
          ),
        ],
      ),
    );
  }
}