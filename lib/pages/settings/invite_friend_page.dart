// invite_friend_page.dart

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:prog/assets/colors.dart';
import 'package:prog/assets/fonts.dart';

class InviteFriendPage extends StatelessWidget {
  const InviteFriendPage({super.key});

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
              'invite a Friend',
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
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Invite your friends to join the app!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: AppFonts.mainFont,
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () {
                  // Implement share functionality
                },
                icon: Icon(Icons.share),
                label: Text('Share Invite Link'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.myAccent,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}