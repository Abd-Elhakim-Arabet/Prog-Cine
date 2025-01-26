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
  
  String? _selectedGenre;
  int? _selectedYear;

  // Sample genres - replace with your actual genres
  final List<String> _genres = [
    'Action',
    'History',
    'Musical',
    'Horror',
     'Drama',
    'Fantasy',
    'Animation'
  ];

  // Generate a list of years from 1900 to current year
  final List<int> _years = List.generate(
    DateTime.now().year - 1900 + 1,
    (index) => 1900 + index,
  ).reversed.toList();

  void _performSearch() {
    if (_searchController.text.isNotEmpty) {
      _databaseService.searchMoviesByName(_searchController.text).listen((snapshot) {
        final results = snapshot.docs.map((doc) => doc.data()).toList();
        widget.onSearchResults(results);
      });
    } else if (_selectedGenre != null) {
      _databaseService.searchMoviesByGenre(_selectedGenre!).listen((snapshot) {
        final results = snapshot.docs.map((doc) => doc.data()).toList();
        widget.onSearchResults(results);
      });
    } else if (_selectedYear != null) {
      _databaseService.searchMoviesByYear(_selectedYear!).listen((snapshot) {
        final results = snapshot.docs.map((doc) => doc.data()).toList();
        widget.onSearchResults(results);
      });
    } else {
      widget.onSearchResults([]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 45,
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _searchController,
                  onChanged: (value) {
                    setState(() {
                      _selectedGenre = null;
                      _selectedYear = null;
                    });
                    _performSearch();
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
        ),
        SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: AppColors.myAccent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: DropdownButton<String>(
                  isExpanded: true,
                  value: _selectedGenre,
                  hint: Text('Select Genre', style: TextStyle(color: AppColors.myBackground)),
                  dropdownColor: AppColors.myAccent,
                  style: TextStyle(color: AppColors.myBackground),
                  underline: Container(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedGenre = newValue;
                      _selectedYear = null;
                      _searchController.clear();
                    });
                    _performSearch();
                  },
                  items: _genres.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: AppColors.myAccent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: DropdownButton<int>(
                  isExpanded: true,
                  value: _selectedYear,
                  hint: Text('Select Year', style: TextStyle(color: AppColors.myBackground)),
                  dropdownColor: AppColors.myAccent,
                  style: TextStyle(color: AppColors.myBackground),
                  underline: Container(),
                  onChanged: (int? newValue) {
                    setState(() {
                      _selectedYear = newValue;
                      _selectedGenre = null;
                      _searchController.clear();
                    });
                    _performSearch();
                  },
                  items: _years.map<DropdownMenuItem<int>>((int value) {
                    return DropdownMenuItem<int>(
                      value: value,
                      child: Text(value.toString()),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}