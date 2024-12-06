// location_page.dart

import 'package:flutter/material.dart';
import 'package:prog/assets/colors.dart';
import 'package:prog/assets/fonts.dart';

class LocationPage extends StatelessWidget {
  const LocationPage({super.key});

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
              'Location',
              style: TextStyle(
                fontFamily: AppFonts.mainFont,
                fontWeight: FontWeight.w700,
                letterSpacing: 1.2, // that's looks just kinda cool
                color: Colors.white,
              ),
            ),
            backgroundColor: AppColors.myBackground,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.location_on, size: 100, color: Colors.white),
            SizedBox(height: 20),
            Text(
              'Your current location is not set.',
              style: TextStyle(
                fontFamily: AppFonts.mainFont,
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement location settings
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.myAccent,
              ),
              child: Text(
                'Set Location',
                style: TextStyle(
                  fontFamily: AppFonts.mainFont,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}