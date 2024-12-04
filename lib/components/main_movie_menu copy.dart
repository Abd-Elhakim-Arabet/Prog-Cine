import 'package:flutter/material.dart';
import 'package:prog/assets/colors.dart';
import 'package:prog/assets/fonts.dart';

class mainMovieMenu extends StatefulWidget {
  const mainMovieMenu({super.key});

  @override
  State<mainMovieMenu> createState() => _mainMovieMenuState();
}

class _mainMovieMenuState extends State<mainMovieMenu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      child: PageView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
                color: AppColors.myPrimary,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(56),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 16,
                    offset: Offset(0, 3),
                  ),
                ]),
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(56),
                            topRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          )),
                      height: 200,
                      child: Image.asset("lib/assets/images/end.jpg",
                          fit: BoxFit.fill,),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Venom",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: AppFonts.mainFont,
                              fontSize: 19),
                        ),
                        Text(
                          "New!!",
                          style: TextStyle(
                              color: Colors.yellow,
                              fontFamily: AppFonts.yellowFont,
                              fontSize: 25),
                        ),
                      ],
                    ),
                  ],
                )),
          );
        },
      ),
    );
  }
}
