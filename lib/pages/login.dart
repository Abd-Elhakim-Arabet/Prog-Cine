import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:prog/assets/colors.dart';
import 'package:prog/assets/fonts.dart';
import 'package:prog/components/corner_square.dart';
import 'package:prog/components/myTextField.dart';
import 'package:prog/components/my_google_btn.dart';
import 'package:prog/components/my_long_btn.dart';

class loginPage extends StatefulWidget {
  final VoidCallback showRegisterPage;
  const loginPage({super.key, required this.showRegisterPage});

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  @override
  Widget build(BuildContext context) {
    final _emailController = TextEditingController();
    final _passwordController = TextEditingController();

    void register() async {
      showDialog(
          context: context,
          builder: (context) {
            return Center(child: CircularProgressIndicator());
          });

      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: _emailController.text.trim(),
            password: _passwordController.text.trim());
      } catch (e) {
        print(e);
      }

      Navigator.of(context).pop();
    }

    void dispose() {
      _emailController.dispose();
      _passwordController.dispose();
      super.dispose();
    }

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
                      "Login",
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
                    hint: "Password",
                    obsecure: true,
                    controller: _passwordController,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, "/resetPassword");
                        },
                        child: Text(
                          "forgot password?",
                          style: TextStyle(
                              color: AppColors.myPrimary,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              fontFamily: AppFonts.mainFont),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                GestureDetector(
                  onTap: () {
                    register();
                  },
                  child: myLongBtn(
                    mytext: "Login",
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
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      "Not a Member?",
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
                      onTap: widget.showRegisterPage,
                      child: Text(
                        "Register Now",
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
