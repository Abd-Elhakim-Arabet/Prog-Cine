import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:prog/data/models.dart';

const String MOVIE_COLLECTION_REFERENCE = 'movies';
const String THEATER_COLLECTION_REFERENCE = 'theatre';
const String THEATER_DAY_COLLECTION_REFERENCE = 'theatreday';
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
  late final CollectionReference<TheaterDay> _theaterDayCollectionReference;
  late final CollectionReference<Schedule> _scheduleCollectionReference;

  DatabaseService(){
   _movieCollectionReference = _firestore.collection(MOVIE_COLLECTION_REFERENCE).withConverter<Movie>
    (fromFirestore: (snapshot, _) => Movie.fromJson(snapshot.data()!), toFirestore: (movie, _ ) => movie.toJson());
     _theaterCollectionReference = _firestore
        .collection(THEATER_COLLECTION_REFERENCE)
        .withConverter<Theater>(
          fromFirestore: (snapshot, _) => Theater.fromJson(snapshot.data()!),
          toFirestore: (theater, _) => theater.toJson(),
        );

    _theaterDayCollectionReference = _firestore
        .collection(THEATER_DAY_COLLECTION_REFERENCE)
        .withConverter<TheaterDay>(
          fromFirestore: (snapshot, _) => TheaterDay.fromJson(snapshot.data()!),
          toFirestore: (theaterDay, _) => theaterDay.toJson(),
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
  CollectionReference<Theater> get theaterCollection => _theaterCollectionReference;
  CollectionReference<TheaterDay> get theaterDayCollection => _theaterDayCollectionReference;
  CollectionReference<Schedule> get scheduleCollection => _scheduleCollectionReference;

  Stream<QuerySnapshot> getMovies() {
    return _movieCollectionReference.snapshots();
  }

  Future< void>addMovie(Movie movie) async {
    _movieCollectionReference.add(movie);
  }

  Stream<QuerySnapshot> getTheaters() {
    return _theaterCollectionReference.snapshots();
  }

   Future< void> addTheater(Theater theater) async {
    _theaterCollectionReference.add(theater);
  }


  Stream<QuerySnapshot> getTheaterDays() {
    return _theaterDayCollectionReference.snapshots();
  }

  void addTheaterDay(TheaterDay theaterDay) async {
    _theaterDayCollectionReference.add(theaterDay);
  }

  Stream<QuerySnapshot> getSchedule() {
    return _scheduleCollectionReference.snapshots();
  }

  void addSchedule(Schedule schedule) async {
    _scheduleCollectionReference.add(schedule);
  }
}