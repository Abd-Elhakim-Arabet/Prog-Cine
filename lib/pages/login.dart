import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:prog/assets/colors.dart';
import 'package:prog/assets/fonts.dart';
import 'package:prog/components/corner_square.dart';
import 'package:prog/components/myTextField.dart';
import 'package:prog/components/myTextFormField.dart';
import 'package:prog/components/my_google_btn.dart';
import 'package:prog/components/my_long_btn.dart';
import 'package:prog/utils/myvalidator.dart';

class loginPage extends StatefulWidget {
  final VoidCallback showRegisterPage;
  const loginPage({super.key, required this.showRegisterPage});

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final formKey = GlobalKey<FormState>();

    void register() async {
      if (!formKey.currentState!.validate()){
        return;
      }
      showDialog(
          context: context,
          builder: (context) {
            return Center(child: CircularProgressIndicator());
          });

      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passwordController.text.trim());
      } on FirebaseAuthException catch (e){
        String message = '';
        Icon icon;
        switch (e.code) {
          case 'invalid-email':
            message = 'The email address is badly formatted.';
            icon = Icon(Icons.email, color: Colors.white,);
            break;
          case 'user-not-found':
            message = 'No user found for that email.';
            icon = Icon(Icons.email, color: Colors.white,);
            break;
          case 'wrong-password':
            message = 'The password is invalid.';
            icon = Icon(Icons.lock, color: Colors.white,);
            break;
          case 'invalid-credential':
            message = 'Invalid credentials.';
            icon = Icon(Icons.error, color: Colors.white,);
          case 'user-disabled':
            message = 'The user account has been disabled by an administrator.';
            icon = Icon(Icons.account_circle, color: Colors.white,);
            break;
          case 'too-many-requests':
            message = 'Too many requests. Try again later.';
            icon = Icon(Icons.error, color: Colors.white,);
            break;
          case 'operation-not-allowed':
            message = 'Email & Password accounts are not enabled.';
            icon = Icon(Icons.error, color: Colors.white,);
            break;
          default:
            message = 'An error occurred.';
            print(e.code);
            icon = Icon(Icons.error, color: Colors.white,);
            break;
        }
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Row(
            children: [
              icon,
              SizedBox(width: 10,),
              Text(message),
            ],
          ),
          backgroundColor: Colors.red,
        ));
        
      }
      catch (e) {
        print(e);
      }
      Navigator.pop(context);

    }

    void dispose() {
      emailController.dispose();
      passwordController.dispose();
      super.dispose();
    }

    return Scaffold(
      backgroundColor: AppColors.myBackground,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Form(
              key: formKey,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      cornerSquare(),
                    ],
                  ),
                  Row(
                    children: const [
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
                    child: MyTextFormField(
                      auto: false,
                      validator: emailValidator,
                      hint: "Email",
                      obsecure: false,
                      controller: emailController,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.0),
                    child: MyTextFormField(
                      auto: false,
                      validator: passValidator,
                      hint: "Password",
                      obsecure: true,
                      controller: passwordController,
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
