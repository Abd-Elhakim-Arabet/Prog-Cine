class Movie {
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

  Movie.fromJson(Map<String, Object?> json)
      : this(
          id: json['id']! as int,
          name: json['name']! as String,
          year: json['year']! as int,
          bigImage: json['bigImage']! as String,
          smallImage: json['smallImage']! as String,
          description: json['description']! as String,
          genre: json['genre']! as String,
          duration: json['duration']! as String,
          imdbRating: json['imdbRating']! as String,
          rottenTomatoesRating: json['rottenTomatoesRating']! as String,
        );

  Movie copyWith({
    int? id,
    String? name,
    int? year,
    String? bigImage,
    String? smallImage,
    String? description,
    String? genre,
    String? duration,
    String? imdbRating,
    String? rottenTomatoesRating,
  }) {
    return Movie(
      id: id ?? this.id,
      name: name ?? this.name,
      year: year ?? this.year,
      bigImage: bigImage ?? this.bigImage,
      smallImage: smallImage ?? this.smallImage,
      description: description ?? this.description,
      genre: genre ?? this.genre,
      duration: duration ?? this.duration,
      imdbRating: imdbRating ?? this.imdbRating,
      rottenTomatoesRating: rottenTomatoesRating ?? this.rottenTomatoesRating,
    );
  }

  Map<String, Object?> toJson() {
    return {
      'id': id,
      'name': name,
      'year': year,
      'bigImage': bigImage,
      'smallImage': smallImage,
      'description': description,
      'genre': genre,
      'duration': duration,
      'imdbRating': imdbRating,
      'rottenTomatoesRating': rottenTomatoesRating,
    };
  }
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
  final int theaterId;
  final DateTime date;
  final List<Schedule> schedules;

  TheaterDay({
    required this.theaterId,
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
