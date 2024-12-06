import 'package:flutter/material.dart';
import 'package:prog/assets/colors.dart';
import 'package:prog/assets/fonts.dart';
import 'package:prog/components/my_long_btn.dart';

class welcomePage extends StatelessWidget {
  final VoidCallback goToAtuh;
  const welcomePage({super.key, required this.goToAtuh});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.myBackground,
      body: Stack(
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              image: DecorationImage(
                alignment: Alignment.center,
                image: AssetImage("lib/assets/images/arrivalBg.png"),
                fit: BoxFit.contain,
              ),
            ),
            child: Container(),
          ),
          Column(
            children: [
              SizedBox(height: 100),
              Image.asset(
                "lib/assets/images/MDLogo.png",
                fit: BoxFit.cover,
                height: 100,
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 80.0),
                child: Text(
                  "Explore the Latest World Class Movies Aired Near You",
                  style: TextStyle(
                      color: AppColors.myAccent,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      fontFamily: AppFonts.mainFont),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: goToAtuh,
                child: Center(child: myLongBtn(mytext: "Join Now")),
              ),
              SizedBox(height: 70),
            ],
          ),
        ],
      ),
    );
  }
}
