import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:prog/assets/colors.dart';
import 'package:prog/assets/fonts.dart';
import 'package:prog/components/single_use/theatre_page/theatres_list.dart';
import 'package:prog/data/dummy_data.dart';
import 'package:prog/data/models.dart';
import 'package:prog/services/storage/database_service.dart';

class theatrePage extends StatefulWidget {
  const theatrePage({super.key});

  @override
  State<theatrePage> createState() => _theatrePageState();
}

class _theatrePageState extends State<theatrePage> {
  final DatabaseService _dbService = DatabaseService();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.myBackground,
      body: SingleChildScrollView(
            child:  Column(
              
              children: [
                SizedBox(height: 70,),
                  
               
                
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          
                        },
                        style: ElevatedButton.styleFrom(
                              
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10), 
                          ),
                          padding: EdgeInsets.all( 20),
                        ),
                        child: Text("add theatre",style: TextStyle(color: Colors.white)),
                      ),
                      Text(
                        "Cinema",
                        style: TextStyle(
                          fontSize: 20,
                          color: AppColors.myPrimary,
                          fontFamily: AppFonts.mainFont,
                        ),
                        ),
                       
                        
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                theatresList(theatres: theaters,),],

            ),
      ),
    );
  } 
 
}