import 'package:cloud_firestore/cloud_firestore.dart';

class Movie {
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

  Schedule.fromJson(Map<String,dynamic> json):
  this (
    theaterId: json["theaterId"]! as String ,
    movieId: json["movieId"]! as String,
    startTime: (json["startTime"]! as Timestamp).toDate(),
    date: (json["date"]! as Timestamp).toDate()
    );


  Schedule Copy({String ? theaterId,String ? movieId,DateTime?startTime, DateTime?date}){
    return Schedule(
      theaterId: theaterId?? this.theaterId
    , movieId: movieId?? this.movieId
    , startTime: startTime?? this.startTime,
    date: date?? this.date
    );

  }
  Map<String,dynamic> toJson(){
    return{
      "theaterId":theaterId,
      "movieId":movieId,
      "startTime": startTime,
      "date": date
    };
  }
  
  
}
  

class Theater {
  final String name;
  final String location;
  final String firstMovieTime;
  final String lastMovieTime;
  final String image;
  final List<int> days;


  Theater({
    required this.name,
    required this.location,
    required this.firstMovieTime,
    required this.lastMovieTime,
    required this.image,
    required this.days,
  });
    Theater.fromJson(Map<String, dynamic> json)
      : 
        name = json['name']! as String,
        location = json['location']! as String,
        firstMovieTime = json['firstMovieTime']! as String,
        lastMovieTime = json['lastMovieTime']! as String,
        image = json['image']! as String,
        days = (json["days"] as List<dynamic>?)?.map((e) => e as int).toList() ?? [];


  Map<String, Object> toJson() {
    return {
      'name': name,
      'location': location,
      'firstMovieTime': firstMovieTime,
      'lastMovieTime': lastMovieTime,
      'image': image,
      'days': days
    };
  }

  Theater copyWith({
    String? name,
    String? location,
    String? firstMovieTime,
    String? lastMovieTime,
    String? image,
    List<int>? days,
  }) {
    return Theater(
      name: name ?? this.name,
      location: location ?? this.location,
      firstMovieTime: firstMovieTime ?? this.firstMovieTime,
      lastMovieTime: lastMovieTime ?? this.lastMovieTime,
      image: image ?? this.image,
      days: days ?? this.days,
    );
  }
}
