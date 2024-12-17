import 'package:cloud_firestore/cloud_firestore.dart';

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

  Movie.fromJson(Map<String, dynamic> json)
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
  final int id;
  final int movieId;
  final DateTime startTime;

  Schedule({
    required this.id,
    required this.movieId,
    required this.startTime,
  });

  Schedule.fromJson(Map<String,dynamic> json):
  this(
    id: json["id"]! as int ,
      movieId:json["movieId"]! as int,
      startTime: (json["startTime"]! as Timestamp ).toDate());


  Schedule Copy({int ? id,int ? movieId,DateTime?startTime}){
    return Schedule(id: id?? this.id
    , movieId: movieId?? this.movieId
    , startTime: startTime?? this.startTime);

  }
  Map<String,dynamic> toJson(){
    return{
      "id":id,
      "movieId":movieId,
      "startTime": startTime,

    };
  }
  
  
}

class TheaterDay {
  final int theaterId;
  final DateTime date;
  final List<int> schedules;

  TheaterDay({
    required this.theaterId,
    required this.date,
    required this.schedules,
  });

 TheaterDay.fromJson(Map<String, dynamic> json)
      : theaterId = json['theaterId']! as int,
        date = (json['date']! as Timestamp).toDate(), 
        schedules = (json["schedules"] as List<dynamic>?)?.map((e) => e as int).toList() ?? [];
            

 
  Map<String, Object> toJson() {
    return {
      'theaterId': theaterId,
      'date': date, 
      'schedules': schedules
    };
  }

 
  TheaterDay copyWith({
    int? theaterId,
    DateTime? date,
    List<int>? schedules,
  }) {
    return TheaterDay(
      theaterId: theaterId ?? this.theaterId,
      date: date ?? this.date,
      schedules: schedules ?? this.schedules,
    );
  }
}

class Theater {
  final int id;
  final String name;
  final String location;
  final String firstMovieTime;
  final String lastMovieTime;
  final String image;
  final List<int> days;


  Theater({
    required this.id,
    required this.name,
    required this.location,
    required this.firstMovieTime,
    required this.lastMovieTime,
    required this.image,
    required this.days,
  });
    Theater.fromJson(Map<String, dynamic> json)
      : id = json['id']! as int,
        name = json['name']! as String,
        location = json['location']! as String,
        firstMovieTime = json['firstMovieTime']! as String,
        lastMovieTime = json['lastMovieTime']! as String,
        image = json['image']! as String,
        days = (json["days"] as List<dynamic>?)?.map((e) => e as int).toList() ?? [];


  Map<String, Object> toJson() {
    return {
      'id': id,
      'name': name,
      'location': location,
      'firstMovieTime': firstMovieTime,
      'lastMovieTime': lastMovieTime,
      'image': image,
      'days': days
    };
  }

  Theater copyWith({
    int? id,
    String? name,
    String? location,
    String? firstMovieTime,
    String? lastMovieTime,
    String? image,
    List<int>? days,
  }) {
    return Theater(
      id: id ?? this.id,
      name: name ?? this.name,
      location: location ?? this.location,
      firstMovieTime: firstMovieTime ?? this.firstMovieTime,
      lastMovieTime: lastMovieTime ?? this.lastMovieTime,
      image: image ?? this.image,
      days: days ?? this.days,
    );
  }
}
