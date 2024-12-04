import "package:flutter/material.dart";
import "package:prog/assets/colors.dart";

class MyTextFormField extends StatelessWidget {
  final hint;
  final bool obsecure;
  final  controller;
  
  final dynamic validator;
  
  final bool auto;
  const MyTextFormField({super.key, this.hint,  this.obsecure = false,  this.controller, this.validator, required this.auto});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode:auto ? AutovalidateMode.onUserInteraction: null ,
      keyboardType: TextInputType.emailAddress,
      validator: validator,
      obscureText: obsecure,
      controller: controller,
      
      decoration: InputDecoration(
        errorStyle: TextStyle(
          decorationColor: Colors.white,
          foreground: Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1
          ..color = Colors.red[200]!,
          fontWeight: FontWeight.w300

        ),
        hintText: hint,
        hintStyle: const TextStyle(color: AppColors.myAccent),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: AppColors.myAccent,
            width: 2.0,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 3.0,
          ),
        ),
        focusedErrorBorder:OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 3.0,
          ),
        ) ,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: AppColors.myPrimary,
            width: 3.0,
          ),
        ),
      ),
      style: const TextStyle(color: Colors.white),
    );
  }
}
