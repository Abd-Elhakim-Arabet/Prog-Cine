import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:prog/assets/colors.dart';

class mySearchBar extends StatelessWidget {
  const mySearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 45,
      child: Row(
        
        children: [
          Expanded(
            child: TextField(
              
              decoration: InputDecoration(
                hintText: "Search",
                hintStyle: TextStyle(color: AppColors.myBackground, ),
                filled: true,
                fillColor: AppColors.myAccent,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10)
                  ),
                  borderSide: BorderSide.none,
                )
              )
              ,
            ),
          ),
      
            
           Container(
            height: 45,
            decoration: BoxDecoration(
              color: AppColors.myAccent,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10)
              )
            ),
            
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Icon(Icons.search, color: AppColors.myBackground,
              size: 25,),
            ))
           
          
          ],
      ),
    );
  }
}
