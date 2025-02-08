import 'dart:convert';

import 'package:prog/services/models.dart';
import 'package:http/http.dart' as http;

// this will implement the same functionality as the database_service.dart but using http requests for supabase
// the implementation is not complete and will need to be completed
class DatabaseCalls {
  static const String _baseUrl = '127.0.0.1:5000';

  static Future<List<Movie>> getAllMovies() async {
    String path = 'api/movies';
    var url = Uri.http(_baseUrl, path);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      List<Movie> movies = [];
      for (var movie in data) {
        movies.add(Movie.fromJson(movie));
      }
      return movies;
    } else {
      throw Exception('Failed to load movies');
    }
  }

  static Future<List<Theater>> getAllTheaters() async {
    String path = 'api/theaters';
    var url = Uri.http(_baseUrl, path);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      List<Theater> theaters = [];
      for (var theater in data) {
        theaters.add(Theater.fromJson(theater));
      }
      return theaters;
    } else {
      throw Exception('Failed to load theaters');
    }
  }

  static Future<List<Schedule>> getAllSchedules() async {
    String path = 'api/schedules';
    var url = Uri.http(_baseUrl, path);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      List<Schedule> schedules = [];
      for (var schedule in data) {
        schedules.add(Schedule.fromJson(schedule));
      }
      return schedules;
    } else {
      throw Exception('Failed to load schedules');
    }
  }

  static Future<Movie> getMovieById(String id) async {
    String path = 'api/movie/$id';
    var url = Uri.http(_baseUrl, path);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return Movie.fromJson(data);
    } else if (response.statusCode == 404) {
      throw Exception('Movie Not Found');
    } else if (response.statusCode == 400) {
      throw Exception('Bad Request');
    } else if (response.statusCode == 500) {
      throw Exception('Server Error');
    } else {
      throw Exception('Failed to load movie');
    }
  }

  static Future<Theater> getTheaterById(String id) async {
    String path = 'api/theater/$id';
    var url = Uri.http(_baseUrl, path);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return Theater.fromJson(data);
    } else if (response.statusCode == 404) {
      throw Exception('Theater Not Found');
    } else if (response.statusCode == 400) {
      throw Exception('Bad Request');
    } else if (response.statusCode == 500) {
      throw Exception('Server Error');
    } else {
      throw Exception('Failed to load theater');
    }
  }

  static Future<Schedule> getScheduleById(String id) async {
    String path = 'api/schedule/$id';
    var url = Uri.http(_baseUrl, path);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return Schedule.fromJson(data);
    } else if (response.statusCode == 404) {
      throw Exception('Schedule Not Found');
    } else if (response.statusCode == 400) {
      throw Exception('Bad Request');
    } else if (response.statusCode == 500) {
      throw Exception('Server Error');
    } else {
      throw Exception('Failed to load schedule');
    }
  }

  /// Retrieves the list of all schedules starting from provided date and based of theater ID.
  ///
  /// if it is desired to schedules for a specific day then a method aggregating the date and movieId should be called after this method
  /// - Parameters:
  ///   - date: The date for which to start retreiving the schedules.
  ///   - theaterId: The ID of the theater for which to retrieve the schedules.
  ///
  /// - Returns: A `Future` that resolves to a list of `Schedule` objects.
  static Future<List<ScheduleWithMovie>> getSchedulesByDateAndTheaterId(
      DateTime startTime, String theaterId) async {
    String path = 'api/schedules/theater';
    startTime = startTime.toUtc();
    Map<String, String> queryParameters = {
      'startTime': startTime.toIso8601String(),
      'theaterId': theaterId
    };
    var url = Uri.http(_baseUrl, path, queryParameters);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print("form the database calls");
      print(data);
      List<ScheduleWithMovie> schedules = [];
      for (var schedule in data) {
        try {
          
        schedules.add(ScheduleWithMovie.fromJson(schedule));
        } catch (e,stacktrace) {
          print(e.toString());
          print(stacktrace);
        }
      }
      return schedules;
    } else {
      throw Exception('Failed to load schedules');
    }
  }

  /// Retrieves the list of all schedules starting from provided date and based of movie ID.
  ///
  /// if it is desired to schedules for a specific day then a method aggregating the date and movieId should be called after this method
  ///
  /// - Parameters:
  ///   - date: The date for which to start retrieving schedules.
  ///   - movieId: The ID of the movie for which to retrieve schedules.
  /// - Returns: A [Future] that completes with a list of [Schedule] objects
  ///   matching the specified date and movie ID.
  static Future<List<ScheduleWithTheater>> getSchedulesByDateAndMovieId(
      DateTime startTime, String movieId) async {
    String path = 'api/schedules/movie';
    startTime = startTime.toUtc();
    Map<String, String> queryParameters = {
      'startTime': startTime.toIso8601String(),
      'movieId': movieId
    };
    var url = Uri.http(_baseUrl, path, queryParameters);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      List<ScheduleWithTheater> schedules = [];
      print("we're in calls");
      print(data);
      for (var schedule in data) {
        try {
        schedules.add(ScheduleWithTheater.fromJson(schedule));
        } catch (e, stackTrace) {
          print(e);
          print(stackTrace);
        }
      }
      return schedules;
    } else {
      throw Exception('Failed to load schedules');
    }
  }

  static Future<List<Movie>> getMoviesFromCollection(String collection) async {
    String path = 'api/moviecollection/$collection';
    var url = Uri.http(_baseUrl, path);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      List<Movie> movies = [];
      print(response.body);
      for (var movie in data) {
        movies.add(Movie.fromJson(movie));
      }
      return movies;
    } else if (response.statusCode == 404) {
      print(response.body);
      throw Exception('Collection Not Found');
    } else {
      print(response.body);
      throw Exception('Failed to load movies');
    }
  }

  static Future<List<Movie>> searchMovies(
      String? name, String? genre, int? year) async {
    String path = 'api/movies/search';
    Map<String, String?> queryParameters = {
      'name': name,
      'genre': genre,
      'year': year?.toString() ?? ''
    };
    var url = Uri.http(_baseUrl, path, queryParameters);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      List<Movie> movies = [];
      for (var movie in data) {
        movies.add(Movie.fromJson(movie));
      }
      return movies;
    } else {
      throw Exception('Failed to load movies');
    }
  }

  static Future<List<String>> getGenres() async {
    String path = 'api/movies/genres';
    var url = Uri.http(_baseUrl, path);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      List<String> genres = List<String>.from(data);
      return genres;
    } else {
      return [
        "Musical",
        "Action",
        "History",
        "Animation",
        "Animation ",
        "Fantasy",
        "Horror",
        "Batman"
      ];
    }
  }

}
