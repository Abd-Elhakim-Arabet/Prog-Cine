import "package:flutter/material.dart";
import "package:prog/assets/colors.dart";

class myTextField extends StatelessWidget {
  final hint;
  final bool obsecure;
  final  controller;
  const myTextField({super.key, this.hint,  this.obsecure = false,  this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obsecure,
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: AppColors.myAccent),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: AppColors.myAccent,
            width: 2.0,
          ),
        ),
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
