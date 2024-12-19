import 'package:flutter/material.dart';
import 'package:prog/assets/colors.dart';
import 'package:prog/assets/fonts.dart';
import 'package:prog/services/models.dart';
import 'package:prog/pages/movies/movie_description.dart';

class movieCard2 extends StatelessWidget {
  final Movie movie;
  const movieCard2({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => movieDescription(movie: movie)));
      },
      child: Container(
        width: 200,
        child: Column(
          children: [
            Container(
                  width: 200,
                  height: 240,
                  margin: EdgeInsets.symmetric(horizontal: 10,),
                  decoration: BoxDecoration(
                    color: AppColors.myPrimary,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
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
                              movie.smallImage,
                              height: 100,
                              width: 190,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                ),
                SizedBox(height: 5,),
                Padding(
                  padding: const EdgeInsets.only(left:  20.0,),
                  child: Text(movie.name,
                  maxLines: 1, 
                  style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    color: Colors.white,
                    fontFamily: AppFonts.mainFont,
                    fontSize: 16
                  ),),
                )
          ],
        ),
      ),
    );
  }
}