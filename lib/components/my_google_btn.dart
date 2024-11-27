import 'package:flutter/material.dart';
import 'package:prog/assets/fonts.dart';

class myGoogleBtn extends StatelessWidget {
  const myGoogleBtn ({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 365,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13),
        color: Colors.black
      ),
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
            const Text("Continue With Google", style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w700,
              fontFamily: AppFonts.mainFont
            ),),
          const SizedBox(width: 20,),
            
            SizedBox(
              height: 50,
              width: 50,
              child: Image.asset("lib/assets/images/google.png"),
            ),
        ],
      ),
    );
  }
}
