// Updated profile_page.dart

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:prog/assets/colors.dart';
import 'package:prog/assets/fonts.dart';
import 'package:prog/blocs/my_user_bloc/my_user_bloc.dart';
import 'package:prog/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:prog/blocs/update_user_info_bloc/update_user_info_bloc.dart';
import 'package:prog/components/multiple_use/surfer.dart';
import 'package:prog/services/storage/database_service.dart';
import 'settings/privacy_page.dart';
import 'settings/location_page.dart';
import 'settings/help_support_page.dart';
import 'settings/settings_page.dart';
import 'settings/invite_friend_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final DatabaseService databaseService = DatabaseService();

  @override
  Widget build(BuildContext context) {
    var profileInfo = Flexible(
      flex: 0,
      child: Column(
        children: [
          Container(
            height: 100,
            width: 100,
            margin: EdgeInsets.only(top: 30),
            child: Stack(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.amber,
                  backgroundImage: AssetImage('lib/assets/images/HAKIM1.jpg'),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Text(
            "Abdelhakim Arabet",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w700,
              fontFamily: AppFonts.mainFont,
            ),
          ),
          Text(
            "testing@hakim.com",
            style:
                TextStyle(color: Colors.white54, fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
    var header = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
/*         SizedBox(width: 20),
        Icon(Icons.arrow_back_ios, size: 30, color: Colors.white),
        SizedBox(width: 20), */
        profileInfo,
/*         SizedBox(width: 20),
        Icon(Icons.sunny, size: 30, color: Colors.white),
        SizedBox(width: 20), */
      ],
    );
    return BlocListener<UpdateUserInfoBloc, UpdateUserInfoState>(
      listener: (context, state) {
        if (state is UploadPictureSuccess) {
          setState(() {
            context.read<MyUserBloc>().state.user!.photoUrl = state.userImage;
          });
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.myBackground,
        body: Column(
          children: <Widget>[
            SizedBox(height: 60),
            profileInfo,
            SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  ProfileListItem(
                    icon: Icons.verified_user,
                    text: 'Privacy',
                    hasNavigation: true,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PrivacyPage()),
                      );
                    },
                  ),
                  ProfileListItem(
                    icon: Icons.location_on_outlined,
                    text: 'Location',
                    hasNavigation: true,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LocationPage()),
                      );
                    },
                  ),
                  ProfileListItem(
                    icon: Icons.help_outline,
                    text: 'Help and Support',
                    hasNavigation: true,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HelpSupportPage()),
                      );
                    },
                  ),
                  ProfileListItem(
                    icon: Icons.settings,
                    text: 'Settings',
                    hasNavigation: true,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SettingsPage()),
                      );
                    },
                  ),
                  ProfileListItem(
                    icon: Icons.group_add_outlined,
                    text: 'Invite a Friend',
                    hasNavigation: true,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => InviteFriendPage()),
                      );
                    },
                  ),
                  ProfileListItem(
                    icon: Icons.logout_rounded,
                    text: 'Logout',
                    hasNavigation: false,
                    onTap: () {
                      context.read<SignInBloc>().add(SignOutRequired());
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileListItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool hasNavigation;
  final VoidCallback? onTap;

  const ProfileListItem({
    super.key,
    required this.icon,
    required this.text,
    this.hasNavigation = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40).copyWith(bottom: 20),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(30),
        child: Ink(
          height: 50,
          padding: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Color(0xFFCBAAC5),
          ),
          child: Row(
            children: [
              Icon(
                icon,
                size: 25,
                color: Colors.black,
              ),
              SizedBox(width: 25),
              Text(
                text,
                style: TextStyle(
                  fontFamily: AppFonts.mainFont,
                  color: Colors.black,
                ),
              ),
              Spacer(),
              if (hasNavigation) Icon(Icons.chevron_right_outlined, size: 25),
            ],
          ),
        ),
      ),
    );
  }
}
