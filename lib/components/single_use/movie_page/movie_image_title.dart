import 'package:flutter/material.dart';
import 'package:prog/assets/colors.dart';
import 'package:prog/assets/fonts.dart';

class MovieImageTitle extends StatelessWidget {
  final String imageUrl;
  final String title;     

  const MovieImageTitle({super.key, required this.imageUrl, required this.title});

  @override
  Widget build(BuildContext context) {
    return 
       Container(
        
        width: double.infinity,
        height: 400,
        margin: EdgeInsets.only(left: 10,right: 10,top: 45,bottom: 10),
        decoration: BoxDecoration(
          color: AppColors.myPrimary,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                        bottomLeft: Radius.circular(60),
                        bottomRight: Radius.circular(60),
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40),
                      ),
                      child: Image.network(
                        
                        imageUrl,
                        height: 320,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 6),
                Row(
                  children: [SizedBox(width: 20,),
                    Text(
                      title,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: AppFonts.mainFont,
                        fontSize: 22,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ],
            ),
            Positioned(
              bottom: 65,
              right: 20,

            child: SizedBox(
              height: 40,
              width: 40,
              child: FloatingActionButton(
                
                backgroundColor:Colors.black,
                onPressed: () {
                  
                },
                child: Icon(Icons.play_arrow_rounded,size: 25,color: Colors.white,),
                
               
              )),
            ),
          ],
        ),
      )
    ;
  }
}
