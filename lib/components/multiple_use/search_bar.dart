import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:prog/assets/colors.dart';
import 'package:prog/assets/fonts.dart';
import 'package:prog/services/storage/database_calls.dart';

class mySearchBar extends StatefulWidget {
  final Function(Map<String, dynamic>) onSearch;
  const mySearchBar({
    super.key,
    required this.onSearch,
  });

  @override
  State<mySearchBar> createState() => _mySearchBarState();
}

class _mySearchBarState extends State<mySearchBar> {
  final TextEditingController _searchController = TextEditingController();
  final TextEditingController _yearController = TextEditingController();

  String? selectedGenre;

  Map<String, dynamic> get currentSearchParams => {
        'name': _searchController.text.isEmpty ? null : _searchController.text,
        'genre': selectedGenre == 'All genres' ? null : selectedGenre,
        'year': _yearController.text.isEmpty ? null : int.tryParse(_yearController.text),
      };

  void _updateSearch() {
    widget.onSearch(currentSearchParams);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.myAccent,
          ),
          child: TextField(
            controller: _searchController,
            onChanged: (_) => _updateSearch(),
            style: const TextStyle(
              color: AppColors.myPrimary,
              fontFamily: AppFonts.mainFont,
            ),
            decoration: const InputDecoration(
              hintText: "Search",
              hintStyle: TextStyle(
                color: AppColors.myBackground,
                fontFamily: AppFonts.mainFont,
              ),
              prefixIcon: Icon(
                Icons.search,
                color: AppColors.myAccent,
              ),
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 14,
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  color: AppColors.myPrimary,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: FutureBuilder<List<String>>(
                  future: DatabaseCalls.getGenres(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return const Text('Error loading genres');
                    } else {
                      final genres = snapshot.data!;
                      genres.insert(0,'All genres');
                      return DropdownSearch<String>(
                        selectedItem: 'All genres',
                        items: (filter, loadProps) => genres,
                        onChanged: (value) {
                          print(value);
                          selectedGenre = value;
                          _updateSearch();
                        },
                      
                      );
                    }
                  },
                ),
              ),
            ),
            const SizedBox(width: 8),
            SizedBox(
              width: 100,
              child: TextField(
                controller: _yearController,
                decoration: InputDecoration(
                  hintText: 'Year',
                  fillColor: AppColors.myPrimary,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                ),
                keyboardType: TextInputType.number,
                onChanged: (_) => _updateSearch(),
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
    _yearController.dispose();
    super.dispose();
  }
}
