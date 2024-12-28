import 'package:flutter/material.dart';
import 'package:prog/assets/colors.dart';
import 'package:prog/services/models.dart';

import 'package:prog/services/storage/database_service.dart';

class mySearchBare extends StatefulWidget {
  final Function(List<Movie>) onSearchResults;
  
  const mySearchBare({
    super.key, 
    required this.onSearchResults
  });

  @override
  State<mySearchBare> createState() => _MySearchBarState();
}

class _MySearchBarState extends State<mySearchBare> {
  final DatabaseService _databaseService = DatabaseService();
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _searchController,
              onChanged: (value) {
                if (value.isNotEmpty) {
                  _databaseService.searchMoviesByName(value).listen((snapshot) {
                    final results = snapshot.docs.map((doc) => doc.data()).toList();
                    
                    widget.onSearchResults(results);
                  });
                } else {
                  widget.onSearchResults([]);
                }
              },
              decoration: InputDecoration(
                hintText: "Search",
                hintStyle: TextStyle(color: AppColors.myBackground),
                filled: true,
                fillColor: AppColors.myAccent,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10)
                  ),
                  borderSide: BorderSide.none,
                )
              ),
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
              child: Icon(
                Icons.search, 
                color: AppColors.myBackground,
                size: 25,
              ),
            )
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}