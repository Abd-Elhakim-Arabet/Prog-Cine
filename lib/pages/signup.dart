//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:prog/assets/colors.dart';
import 'package:prog/assets/fonts.dart';
import 'package:prog/components/corner_square.dart';
import 'package:prog/components/myTextField.dart';
import 'package:prog/components/my_google_btn.dart';
import 'package:prog/components/my_long_btn.dart';
import 'package:prog/pages/home_page.dart';

class signupPage extends StatelessWidget {
  final VoidCallback showLoginPage;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _usernameController = TextEditingController();
  void register(context) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      addUserDetails(
          _emailController.text.trim(), _usernameController.text.trim());
    } catch (e) {
      print(e);
    }
  }

  Future addUserDetails(email, username) async {
    await FirebaseFirestore.instance
        .collection("users")
        .add({'email': email, 'username': username});
  }

  void dipose() {
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
  }

  signupPage({super.key, required this.showLoginPage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.myBackground,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    cornerSquare(),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 40,
                    ),
                    Text(
                      "Sign Up",
                      style: TextStyle(
                        color: AppColors.myYellow,
                        fontFamily: AppFonts.yellowFont,
                        fontSize: 30,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 70,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: myTextField(
                    hint: "Email",
                    obsecure: false,
                    controller: _emailController,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: myTextField(
                    hint: "User Name",
                    obsecure: false,
                    controller: _usernameController,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: myTextField(
                    hint: "Password",
                    obsecure: true,
                    controller: _passwordController,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 40,
                ),
                GestureDetector(
                  onTap: () {
                    register(context);
                  },
                  child: myLongBtn(
                    mytext: "Sign Up",
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                myGoogleBtn(),
              ],
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 50),
                    Text(
                      "Already Have an Account?",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          fontFamily: AppFonts.mainFont),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: showLoginPage,
                      child: Text(
                        "Log In",
                        style: TextStyle(
                            color: AppColors.myPrimary,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            fontFamily: AppFonts.mainFont),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
