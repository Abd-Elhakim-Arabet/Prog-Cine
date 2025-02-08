import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prog/blocs/theater_schedules_bloc/theater_schedules_bloc.dart';
import 'package:prog/components/single_use/theatre_page/theatre_card.dart';
import 'package:prog/services/models.dart';
import 'package:prog/pages/theatres/cinema_description.dart';

class theatresList extends StatefulWidget {
  final List<Theater> theatres;
  const theatresList({super.key, required this.theatres});

  @override
  State<theatresList> createState() => _theatresListState();
}

class _theatresListState extends State<theatresList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap:
            true, // Ensure the ListView takes up only the necessary space
        physics:
            NeverScrollableScrollPhysics(), // Disable ListView's own scrolling
        itemCount: widget.theatres.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              InkWell(
                  onTap: () {
                    var cinema = widget.theatres[index];
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => 
                            BlocProvider(create: (context) => TheaterSchedulesBloc(theaterId: cinema.id)..add(LoadTheaterSchedules(theaterId:  cinema.id)),
                            child: 
                            cinemaDescription(
                                cinema: cinema))));
                  },
                  child: theatreCard(theatre: widget.theatres[index])),
              SizedBox(height: 10),
            ],
          );
        });
  }
}
