import 'package:flutter/material.dart';
import 'package:prog/assets/colors.dart';
import 'package:prog/assets/fonts.dart';

class mainMovieMenu extends StatefulWidget {
  final dynamic pgController;

  const mainMovieMenu({super.key, this.pgController});

  @override
  State<mainMovieMenu> createState() => _mainMovieMenuState();
}

class _mainMovieMenuState extends State<mainMovieMenu> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children:[

      Container(
        height: 280,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 16,
            offset: Offset(0, 3),
          ),
        ]),
        child: PageView.builder(
          controller: widget.pgController,
          itemCount: 3,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: AppColors.myPrimary,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(56),
                  bottomLeft: Radius.circular(18),
                  bottomRight: Radius.circular(18),
                  topRight: Radius.circular(18)
                ),
              ),
              child: Padding(
                  padding: const EdgeInsets.all(4.0),
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
                        height: 270,
                        width: double.infinity,
                        child: Image.asset(
                          "lib/assets/images/stray.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                      
                      
                    ],
                  )),
            );
          },
        ),
      ),

      ]
    );
  }
}
