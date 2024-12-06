// privacy_page.dart

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:prog/assets/colors.dart';
import 'package:prog/assets/fonts.dart';
import 'package:prog/services/storage/shared_pref.dart';

class PrivacyPage extends StatefulWidget {
  const PrivacyPage({super.key});

  @override
  State<PrivacyPage> createState() => _PrivacyPageState();
}

class _PrivacyPageState extends State<PrivacyPage> {
  bool allowNotifications = SharedPref.getAllowNotifications() ?? false;
  bool locationSharing = SharedPref.getLocationSharing() ?? false;

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
              'Privacy',
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
      body: Column(
        children: [
          //SizedBox(height: 20),
          ListView(
            shrinkWrap: true,
            padding: EdgeInsets.all(20),
            children: [
              SwitchListTile(
                title: Text(
                  'Allow Notifications',
                  style: TextStyle(
                    fontFamily: AppFonts.mainFont,
                    color: Colors.white,
                  ),
                ),
                value: allowNotifications,
                onChanged: (bool value) async {
                  try {
                    await SharedPref.setAllowNotifications(value);
                    allowNotifications = value;
                    setState(() {});
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Row(
                        children: [
                          Icon(Icons.error, color: Colors.white,),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'An error occurred while trying to save your preferences',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      backgroundColor: Colors.red,
                    ));
                  }
                },
              ),
              Divider(color: Colors.grey),
              SwitchListTile(
                title: Text(
                  'Location Sharing',
                  style: TextStyle(
                    fontFamily: AppFonts.mainFont,
                    color: Colors.white,
                  ),
                ),
                value: locationSharing,
                onChanged: (bool value) async{
                  try {
                    await SharedPref.setLocationSharing(value);
                    locationSharing = value;
                    setState(() {});
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Row(
                        children: [
                          Icon(Icons.error, color: Colors.white,),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'An error occurred while trying to save your preferences',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      backgroundColor: Colors.red,
                    ));
                  }
                },
              ),
              Divider(color: Colors.grey),
              ListTile(
                title: Text(
                  'Privacy Policy',
                  style: TextStyle(
                    fontFamily: AppFonts.mainFont,
                    color: Colors.white,
                  ),
                ),
                trailing: Icon(Icons.arrow_forward_ios, color: Colors.white),
                onTap: () {
                  // Navigate to Privacy Policy details
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
