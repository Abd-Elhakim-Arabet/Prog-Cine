import 'package:flutter/material.dart';

class cornerSquare extends StatelessWidget {
  const cornerSquare({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 251,
      color: const Color.fromRGBO(0, 0, 0, 0),
      child: Stack(
            alignment: Alignment.topRight, 
            children: [
              Positioned(
                bottom: 20,
                left: 70,
                child: Image.asset(
                  'lib/assets/images/whiteCorn.png', 
                  width: 250, 
                  height: 250,
                  fit: BoxFit.cover, 
                ),
              ),
              Positioned(
                left: 47,
                child: Image.asset(
                  'lib/assets/images/corner.png', 
                  width: 300,
                  height: 251, 
                  fit: BoxFit.contain, 
                ),
              ),
            ],
          ),
      );
  }
}