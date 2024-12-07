class Movie{
  final int id;
  final String name;
  final int year;
  final String bigImage;
  final String smallImage;
  final String description;
  final String genre;
  final String duration;
  final String imdbRating;
  final String rottenTomatoesRating;
  
  Movie({
    required this.id,
    required this.name,
    required this.year,
    required this.bigImage,
    required this.smallImage,
    required this.description,
    required this.genre,
    required this.duration,
    required this.imdbRating,
    required this.rottenTomatoesRating,
  });
}

class Schedule {
  final int id;
  final int movieId;
  final DateTime startTime;

  Schedule({
    required this.id,
    required this.movieId,
    required this.startTime,
  });
}

class TheaterDay {
  final DateTime date;
  final List<Schedule> schedules;

  TheaterDay({
    required this.date,
    required this.schedules,
  });
  
}

class Theater {
  final int id;
  final String name;
  final String location;
  final String firstMovieTime;
  final String lastMovieTime;
  final String image;
  final List<TheaterDay> days;

  Theater({
    required this.id,
    required this.name,
    required this.location,
    required this.firstMovieTime,
    required this.lastMovieTime,
    required this.image,
    required this.days,
  });
}

