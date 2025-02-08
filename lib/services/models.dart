import 'package:cloud_firestore/cloud_firestore.dart';

class Movie {
  String id;
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

  Movie.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id']! as String,
          name: json['name']! as String,
          year: json['year'] is String
              ? int.parse(json['year']! as String)
              : json['year']! as int,
          bigImage: json['bigImage']! as String,
          smallImage: json['smallImage']! as String,
          description: json['description']! as String,
          genre: json['genre']! as String,
          duration: json['duration']! as String,
          imdbRating: json['imdbRating']! as String,
          rottenTomatoesRating: json['rottenTomatoesRating']! as String,
        );

  Movie copyWith({
    String? id,
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

  Map<String, dynamic> toJson() {
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
  final String theaterId;
  final DateTime startTime;
  final String movieId;
  final DateTime date;

  Schedule({
    required this.theaterId,
    required this.movieId,
    required this.startTime,
    required this.date,
  });

  Schedule.fromJson(Map<String, dynamic> json)
      : this(
          theaterId: json["theaterId"]! as String,
          movieId: json["movieId"]! as String,
          startTime: DateTime.parse(json['startTime'] as String).toLocal(),
          date: DateTime.parse(json['date'] as String).toLocal(),
        );

  Schedule Copy(
      {String? theaterId,
      String? movieId,
      DateTime? startTime,
      DateTime? date}) {
    return Schedule(
        theaterId: theaterId ?? this.theaterId,
        movieId: movieId ?? this.movieId,
        startTime: startTime ?? this.startTime,
        date: date ?? this.date);
  }

  Map<String, dynamic> toJson() {
    return {
      "theaterId": theaterId,
      "movieId": movieId,
      "startTime": startTime,
      "date": date
    };
  }
}

class ScheduleWithMovie extends Schedule {
  final Movie movie;

  ScheduleWithMovie({
    required super.theaterId,
    required super.movieId,
    required super.startTime,
    required super.date,
    required this.movie,
  }) : super();

  factory ScheduleWithMovie.fromJson(Map<String, dynamic> json) {
    return ScheduleWithMovie(
      theaterId: json['theaterId'] as String,
      movieId: json['movie']['id'] as String,
      startTime: DateTime.parse(json['startTime'] as String).toLocal(),
      date: DateTime.parse(json['date'] as String).toLocal(),
      movie: Movie.fromJson(json['movie'] as Map<String, dynamic>),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final map = super.toJson();
    map['movie'] = movie.toJson();
    return map;
  }
}

class ScheduleWithTheater extends Schedule {
  final Theater theater;

  ScheduleWithTheater({
    required super.theaterId,
    required super.movieId,
    required super.startTime,
    required super.date,
    required this.theater,
  }) : super();

  factory ScheduleWithTheater.fromJson(Map<String, dynamic> json) {
    return ScheduleWithTheater(
      theaterId: json['theater']['id'] as String,
      movieId: json['movieId'] as String,
      startTime: DateTime.parse(json['startTime'] as String).toLocal(),
      date: DateTime.parse(json['date'] as String).toLocal(),
      theater: Theater.fromJson(json['theater'] as Map<String, dynamic>),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final map = super.toJson();
    map['theater'] = theater.toJson();
    return map;
  }
}

class Theater {
  String id;
  final String name;
  final String location;
  final String firstMovieTime;
  final String lastMovieTime;
  final String image;

  Theater({
    required this.id,
    required this.name,
    required this.location,
    required this.firstMovieTime,
    required this.lastMovieTime,
    required this.image,
  });
  Theater.fromJson(Map<String, dynamic> json)
      : id = json['id']! as String,
        name = json['name']! as String,
        location = json['location']! as String,
        firstMovieTime = json['firstMovieTime']! as String,
        lastMovieTime = json['lastMovieTime']! as String,
        image = json['image']! as String;

  Map<String, Object> toJson() {
    return {
      'id': id,
      'name': name,
      'location': location,
      'firstMovieTime': firstMovieTime,
      'lastMovieTime': lastMovieTime,
      'image': image,
    };
  }

  Theater copyWith({
    String? id,
    String? name,
    String? location,
    String? firstMovieTime,
    String? lastMovieTime,
    String? image,
  }) {
    return Theater(
      id: id ?? this.id,
      name: name ?? this.name,
      location: location ?? this.location,
      firstMovieTime: firstMovieTime ?? this.firstMovieTime,
      lastMovieTime: lastMovieTime ?? this.lastMovieTime,
      image: image ?? this.image,
    );
  }
}
