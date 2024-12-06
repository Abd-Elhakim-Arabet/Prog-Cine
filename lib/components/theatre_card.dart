import 'package:flutter/material.dart';
import 'package:prog/assets/colors.dart';
import 'package:prog/assets/fonts.dart';

class theatreCard extends StatelessWidget {
  const theatreCard({super.key});

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: (){
        Navigator.of(context).pushNamed("/cinemaDescription");
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.myPrimary,
            width: 3,
            
          ),
          borderRadius: BorderRadius.circular(20)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            
            Container(
                width: 200,
                child: Container(
                          width: 200,
                          height: 240,
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            color: AppColors.myPrimary,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
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
                          child: 
                              Padding(
                                padding: const EdgeInsets.all(7.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.7),
                                        spreadRadius: 1,
                                        blurRadius: 5,
                                        offset: Offset(0, 3),
                                      ),
                                    ],
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(5),
                                      topRight: Radius.circular(5),
                                      bottomLeft: Radius.circular(5),
                                      bottomRight: Radius.circular(5),
                                    ),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(5),
                                      topRight: Radius.circular(5),
                                      bottomLeft: Radius.circular(5),
                                      bottomRight: Radius.circular(5),
                                    ),
                                    child: Image.asset(
                                      "lib/assets/images/AlphaCosmosSmall.png",
                                      height: 200,
                                      width: 190,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              
                              
                           
                        ),
                        
                  
                ),
              Container(
               
                child: Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Salle Cosmos Alpha", style: TextStyle(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        fontFamily: AppFonts.mainFont,
                        fontSize: 23,
                      ),),
                      Text("Algiers, Algeria", style: TextStyle(
                        color: AppColors.myAccent,
                        fontFamily: AppFonts.mainFont,
                        fontSize: 16,
                      ),),
                    ],
                  ),
                ),
              )
          ],
        ),
      ),
    );;
  }
}