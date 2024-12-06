import 'package:flutter/material.dart';
import 'package:prog/components/theatre_card.dart';

class theatresList extends StatefulWidget {
  const theatresList({super.key});

  @override
  State<theatresList> createState() => _theatresListState();
}

class _theatresListState extends State<theatresList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        theatreCard(),
        SizedBox(height: 10,),
        theatreCard(),
        SizedBox(height: 10,)
      ],
    );
  }
}