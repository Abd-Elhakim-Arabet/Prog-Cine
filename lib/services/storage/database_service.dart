import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:prog/services/models.dart';

const String MOVIE_COLLECTION_REFERENCE = 'movies';
const String THEATER_COLLECTION_REFERENCE = 'theatre';
const String THEATER_DAY_COLLECTION_REFERENCE = 'theatreday';
const String SCHEDULE_COLLECTION_REFERENCE = 'schedule';

class DatabaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  late final CollectionReference _movieCollectionReference;
   late final CollectionReference _theaterCollectionReference;
  late final CollectionReference _theaterDayCollectionReference;
  late final CollectionReference _scheduleCollectionReference;

  DatabaseService(){
   // _movieCollectionReference = _firestore.collection(MOVIE_COLLECTION_REFERENCE).withConverter<Movie>
    //(fromFirestore: (snapshot, _) => Movie.fromJson(snapshot.data()!), toFirestore: (movie, _ ) => movie.toJson());
    /* _theaterCollectionReference = _firestore
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
*/
   _scheduleCollectionReference = _firestore
        .collection(SCHEDULE_COLLECTION_REFERENCE)
        .withConverter<Schedule>(
          fromFirestore: (snapshot, _) => Schedule.fromJson(snapshot.data()!),
          toFirestore: (schedule, _) => schedule.toJson(),
        );

  }

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