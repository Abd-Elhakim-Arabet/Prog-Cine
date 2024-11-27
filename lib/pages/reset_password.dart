import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:prog/assets/colors.dart';
import 'package:prog/assets/fonts.dart';
import 'package:prog/components/myTextField.dart';
import 'package:prog/components/my_long_btn.dart';

class resetPassword extends StatefulWidget {
  const resetPassword({super.key});

  @override
  State<resetPassword> createState() => _resetPasswordState();
}

class _resetPasswordState extends State<resetPassword> {
  final _emailController = TextEditingController();

  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void resetPass() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text.trim());
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text("Reset Link Has Been Sent To Your Email"),
            );
          });
    } on FirebaseAuthException catch (e)
    ////to fix: if email does not exist, display a message it says it does not exist
    {
      print("hi");
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(e.message.toString()),
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.myPrimary,
      ),
      backgroundColor: AppColors.myBackground,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              "Reset Password",
              style: TextStyle(
                color: Colors.white,
                fontFamily: AppFonts.mainFont,
                fontSize: 25,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              "Enter the email address associated with your account",
              style: TextStyle(
                color: Colors.grey,
                fontFamily: AppFonts.mainFont,
                fontSize: 14,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.all(25.0),
            child: myTextField(
              hint: "Email",
              controller: _emailController,
            ),
          ),
          SizedBox(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 100.0),
            child: GestureDetector(
                onTap: resetPass,
                child: myLongBtn(
                  mytext: "Reset Password",
                )),
          )
        ],
      ),
    );
  }
}
