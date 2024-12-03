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
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.green,
        content: const Row(
          children: [
            Icon(Icons.email, color: Colors.white,),
            Text("Password reset link sent to your email"),
          ],
        ),
      ));
    } on FirebaseAuthException catch (e)
    {
      String message = '';
      Icon icon;
      switch (e.code) {
        case 'auth/invalid-email':
          message = 'No user found for that email.';
          icon = Icon(Icons.email, color: Colors.white,);
          break;
        default:
          message = 'An error occurred.';
          icon = Icon(Icons.error, color: Colors.white,);
          break;
      }
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Row(
          children: [
            icon,
            Text(message),
          ],
        ),
      ));
    }
      /* print("hi");
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(e.message.toString()),
            );
          });
    } */
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

