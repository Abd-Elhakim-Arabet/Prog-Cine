//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prog/assets/colors.dart';
import 'package:prog/assets/fonts.dart';
import 'package:prog/blocs/sign_up_bloc/sign_up_bloc.dart';
import 'package:prog/components/single_use/auth_pages/corner_square.dart';
import 'package:prog/components/multiple_use/myTextField.dart';
import 'package:prog/components/multiple_use/myTextFormField.dart';
import 'package:prog/components/multiple_use/my_google_btn.dart';
import 'package:prog/components/single_use/auth_pages/my_long_btn.dart';
import 'package:prog/utils/myvalidator.dart';
import 'package:prog/pages/home_page.dart';
import 'package:user_repository/user_repository.dart';

class signupPage extends StatefulWidget {
  final VoidCallback showLoginPage;
  signupPage({super.key, required this.showLoginPage});

  @override
  State<signupPage> createState() => _signupPageState();
}

class _signupPageState extends State<signupPage> {
  

  @override
  Widget build(BuildContext context) {
    final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  final _usernameController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  void register() async {
    try {
      if (!_formKey.currentState!.validate()) {
        return;
      }
      /*UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      addUserDetails(
        userCredential.user!.uid,
          _emailController.text.trim(), _usernameController.text.trim());*/

      MyUser myUser = MyUser.empty;
      myUser = myUser.copyWith(
        email: _emailController.text.trim(),
        name: _usernameController.text.trim(),
      );

      context.read<SignUpBloc>().add(
            SignUpRequired(
              myUser,
              _passwordController.text.trim(),
            ),
          );
    } on FirebaseAuthException catch (e) {
      String message = '';
      Icon icon;
      switch (e.code) {
        case 'invalid-email':
          message = 'The email address is badly formatted.';
          icon = Icon(
            Icons.email,
            color: Colors.white,
          );
          break;
        case 'invalid-credential':
          message = 'Invalid credentials.';
          icon = Icon(
            Icons.error,
            color: Colors.white,
          );
          break;
        case 'email-already-in-use':
          message = 'The account already exists for that email.';
          icon = Icon(
            Icons.email,
            color: Colors.white,
          );
          break;
        case 'weak-password':
          message = 'The password provided is too weak.';
          icon = Icon(
            Icons.lock,
            color: Colors.white,
          );
          break;
        default:
          message = 'An error occurred.';
          icon = Icon(
            Icons.error,
            color: Colors.white,
          );
          break;
      }
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Row(
          children: [
            icon,
            SizedBox(
              width: 10,
            ),
            Text(
              message,
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        backgroundColor: Colors.red,
      ));
    } catch (e) {
      print(e);
    }
  }

  Future addUserDetails(String uid, email, username) async {
    await FirebaseFirestore.instance.collection("users").doc(uid).set({
      'email': email,
      'username': username,
    });
  }

  void dipose() {
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
  }
    return BlocListener<SignUpBloc, SignUpState>(
      listener: (context, state) {
        if (state is SignUpSuccess) {
          print('Sign Up success');
        }
        else if (state is SignUpProcess) {

          print('Sign Up Process');
        }
        else if (state is SignUpFailure) {
          print('Sign Up failure');
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.myBackground,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Form(
                key: _formKey,
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
                      child: MyTextFormField(
                        auto: true,
                        validator: emailValidator,
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
                      child: MyTextFormField(
                        auto: true,
                        validator: passValidator,
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
                        register();
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
                        onTap: widget.showLoginPage,
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
      ),
    );
  }
}
