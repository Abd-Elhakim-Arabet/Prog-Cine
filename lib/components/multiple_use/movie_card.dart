import 'package:flutter/material.dart';
import 'package:prog/assets/colors.dart';
import 'package:prog/assets/fonts.dart';
import 'package:prog/services/models.dart';

class movieCard extends StatelessWidget {
  final value;
  final DateTime? date;
  final Movie movie;
  const movieCard({super.key, this.value, required this.movie, this.date});

  @override
  Widget build(BuildContext context) {
    final smallImage = movie.smallImage != "0"
        ? movie.smallImage
        : "https://upload.wikimedia.org/wikipedia/commons/thumb/2/21/Solid_black.svg/1024px-Solid_black.svg.png";
    return Center(
      child: Transform.scale(
        scale: value,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (date != null)
              Text(
                // TODO
                // Fix the time format
                "${date!.hour}:${date!.minute}0 ${date!.hour > 12 ? "pm" : "am"}",
                style: TextStyle(
                  color: AppColors.myAccent,
                  fontFamily: AppFonts.mainFont,
                  fontSize: 17,
                ),
              ),
            if (date != null) SizedBox(height: 10),
            Container(
              width: 200,
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
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
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                          bottomLeft: Radius.circular(5),
                          bottomRight: Radius.circular(5),
                        ),
                      ),
                      child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40),
                            bottomLeft: Radius.circular(5),
                            bottomRight: Radius.circular(5),
                          ),
                          child: Image.network(
                            smallImage,
                            height: 200,
                            width: 190,
                            fit: BoxFit.cover,
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: Text(
                      movie.name,
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: AppFonts.mainFont,
                          fontSize: 14),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
