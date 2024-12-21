import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:prog/services/models.dart';

const String MOVIE_COLLECTION_REFERENCE = 'movies';
const String THEATER_COLLECTION_REFERENCE = 'theatre';
const String SCHEDULE_COLLECTION_REFERENCE = 'schedule';

///////Guid To Use The Database Service
/// 1- import it: import 'package:prog/services/storage/database_service.dart';
/// 2- initialize the db service: final DatabaseService databaseService = DatabaseService();
/// to get the collection do: databaseService.getMovies(),  or databaseService.getTheaters()... etc
/// 3- get it as a list: List movies = snapshot.data?.docs ?? [];
/// 4- access the data as a model: Movie mv=movies[0].data(); or String  mv=movies[index].id;

class DatabaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  late final CollectionReference<Movie> _movieCollectionReference;
  late final CollectionReference<Theater> _theaterCollectionReference;
  late final CollectionReference<Schedule> _scheduleCollectionReference;

  DatabaseService() {
    _movieCollectionReference = _firestore
        .collection(MOVIE_COLLECTION_REFERENCE)
        .withConverter<Movie>(
            fromFirestore: (snapshot, _) => Movie.fromJson(snapshot.data()!),
            toFirestore: (movie, _) => movie.toJson());

    _theaterCollectionReference = _firestore
        .collection(THEATER_COLLECTION_REFERENCE)
        .withConverter<Theater>(
          fromFirestore: (snapshot, _) => Theater.fromJson(snapshot.data()!),
          toFirestore: (theater, _) => theater.toJson(),
        );

    _scheduleCollectionReference = _firestore
        .collection(SCHEDULE_COLLECTION_REFERENCE)
        .withConverter<Schedule>(
          fromFirestore: (snapshot, _) => Schedule.fromJson(snapshot.data()!),
          toFirestore: (schedule, _) => schedule.toJson(),
        );
  }

  CollectionReference<T> _initializeCollection<T>(
    String collectionPath,
    T Function(Map<String, dynamic>) fromJson,
    Map<String, dynamic> Function(T) toJson,
  ) {
    return _firestore.collection(collectionPath).withConverter<T>(
          fromFirestore: (snapshot, _) => fromJson(snapshot.data()!),
          toFirestore: (item, _) => toJson(item),
        );
  }

  CollectionReference<Movie> get movieCollection => _movieCollectionReference;
  CollectionReference<Theater> get theaterCollection =>
      _theaterCollectionReference;
  CollectionReference<Schedule> get scheduleCollection =>
      _scheduleCollectionReference;

  Future<List<Movie>> getMovies() async {
    try {
      final querySnapshot = await _movieCollectionReference.get();
      return querySnapshot.docs.map((doc) => doc.data()).toList();
    } catch (e) {
      print('Error fetching theaters: $e');
      return [];
    }
  }

  Future<void> addMovie(Movie movie) async {
    try {
      final docRef = await _movieCollectionReference.add(movie);

      final generatedId = docRef.id;

      movie.id = generatedId;

      await docRef.update({'id': generatedId});
    } catch (e) {
      print('Error adding theater: $e');
    }
  }

  Future<List<Theater>> getTheaters() async {
    try {
      final querySnapshot = await _theaterCollectionReference.get();
      return querySnapshot.docs.map((doc) => doc.data()).toList();
    } catch (e) {
      print('Error fetching theaters: $e');
      return [];
    }
  }

  Future<void> addTheater(Theater theater) async {
      try {
      final docRef = await _theaterCollectionReference.add(theater);

      final generatedId = docRef.id;

      theater.id = generatedId;

      await docRef.update({'id': generatedId});
    } catch (e) {
      print('Error adding theater: $e');
    }
  }

  Future<List<Schedule>> getSchedules() async {
    try {
      final querySnapshot = await _scheduleCollectionReference.get();
      return querySnapshot.docs.map((doc) => doc.data()).toList();
    } catch (e) {
      print('Error fetching theaters: $e');
      return [];
    }
  }

  void addSchedule(Schedule schedule) async {
    _scheduleCollectionReference.add(schedule);
  }

  Future<List<Schedule>> getSchedulesByDateAndTheatreId(
      DateTime date, String theaterId) async {
    try {
      final startOfDay =
          Timestamp.fromDate(DateTime(date.year, date.month, date.day));
      final endOfDay = Timestamp.fromDate(
        DateTime(date.year, date.month, date.day, 23, 59, 59),
      );

      final querySnapshot = await _scheduleCollectionReference
          .where('theaterId', isEqualTo: theaterId)
          .where('date', isGreaterThanOrEqualTo: startOfDay)
          .where('date', isLessThanOrEqualTo: endOfDay)
          .get();

      final schedules = querySnapshot.docs.map((doc) => doc.data()).toList();

      return schedules;
    } catch (e) {
      print('Error fetching schedules: $e');
      return [];
    }
  }

  Future<List<Movie>> getMoviesFromCollection(String collection) async {
    try {
      final docSnapshot =
          await _firestore.collection("movieCollections").doc(collection).get();

      if (!docSnapshot.exists) {
        print('No collection found with ID: $collection');
        return [];
      }

      final data = docSnapshot.data();
      if (data == null || !data.containsKey('movieIds')) {
        print('No movieIds field found in collection: $collection');
        return [];
      }

      final movieIds = List<String>.from(data['movieIds'] ?? []);

      if (movieIds.isEmpty) {
        return [];
      }
      List<Movie> movies = await getMoviesByIds(movieIds);
      return movies;
    } catch (e) {
      print('Error fetching movies from collection: $e');
      return [];
    }
  }

  Future<List<Schedule>> getSchedulesByDateAndMovieId(
      DateTime date, String movieId) async {
    try {
      final startOfDay =
          Timestamp.fromDate(DateTime(date.year, date.month, date.day));
      final endOfDay = Timestamp.fromDate(
        DateTime(date.year, date.month, date.day, 23, 59, 59),
      );

      final querySnapshot = await _scheduleCollectionReference
          .where('movieId', isEqualTo: movieId)
          .where('date', isGreaterThanOrEqualTo: startOfDay)
          .where('date', isLessThanOrEqualTo: endOfDay)
          .get();

      final schedules = querySnapshot.docs.map((doc) => doc.data()).toList();

      return schedules;
    } catch (e) {
      print('Error fetching schedules: $e');
      return [];
    }
  }

  Future<List<Movie>> getMoviesByIds(List<String> movieIds) async {
    try {
      final querySnapshot = await _movieCollectionReference
          .where(FieldPath.documentId, whereIn: movieIds)
          .get();

      final movieMap = {for (var doc in querySnapshot.docs) doc.id: doc.data()};

      // Build the final list of movies, including duplicates, in the same order
      final movies = movieIds
          .map((id) => movieMap[id])
          .where((movie) => movie != null) 
          .cast<Movie>() 
          .toList();

      return movies;
    } catch (e) {
      print('Error fetching movies: $e');
      return [];
    }
  }
}
