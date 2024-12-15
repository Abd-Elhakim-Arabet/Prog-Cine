import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:prog/data/models.dart';

const String MOVIE_COLLECTION_REFERENCE = 'movies';

class DatabaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  late final CollectionReference _movieCollectionReference;

  DatabaseService(){
    _movieCollectionReference = _firestore.collection(MOVIE_COLLECTION_REFERENCE).withConverter<Movie>
    (fromFirestore: (snapshot, _) => Movie.fromJson(snapshot.data()!), toFirestore: (movie, _ ) => movie.toJson());
  }

  Stream<QuerySnapshot> getMovies() {
    return _movieCollectionReference.snapshots();
  }

  void addMovie(Movie movie) async {
    _movieCollectionReference.add(movie);
  }
}