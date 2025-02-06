import 'package:flutter/material.dart';
import 'package:prog/assets/colors.dart';

class PostComment extends StatelessWidget {
  final TextEditingController controller;
   PostComment({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
            child: TextField(
              controller: controller,
              minLines: 1,
              maxLines: 10,
              style: TextStyle(
                color: Colors.white,
              ),
              maxLength: 500,
              decoration: InputDecoration(
                counterStyle: TextStyle(
                  color: const Color.fromARGB(255, 175, 172, 172),
                ),
                hintText: "Leave a review...",
                hintStyle: TextStyle(
                  color: const Color.fromARGB(255, 175, 172, 172),
                  fontFamily: "Montserrat",
                  fontSize: 15,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: AppColors.myAccent),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: AppColors.myPrimary),
                ),
              ),
            ),
          );
  }
}
