
import 'package:review_repository/review_repository.dart';
import 'package:user_repository/user_repository.dart';

class Review {
  String id;
  String comment;
  int stars;
  DateTime createdAt;
  int likes;
  MyUser user;
  String movieId;


  Review({
    required this.id,
    required this.comment,
    required this.stars,
    required this.createdAt,
    required this.likes,
    required this.user,
    required this.movieId,
  });

  static var empty = Review(
    id: '',
   comment: '', 
   stars: 0,
   createdAt: DateTime.now(),
   likes: 0,
   user: MyUser.empty,
   movieId: ''
   );

  Review copyWith({
    String? id,
    String? comment,
    int? stars,
    DateTime? createdAt,
    int? likes,
    MyUser? user,
    String? movieId
  }) {
    return Review(
      id: id ?? this.id,
      comment: comment ?? this.comment,
      stars: stars ?? this.stars,
      createdAt: createdAt ?? this.createdAt,
      likes: likes ?? this.likes,
      user: user ?? this.user,
      movieId: movieId ?? this.movieId
    );
  }

  ReviewEntity toEntity() {
    return ReviewEntity(
      id: id,
      comment: comment,
      stars: stars,
      createdAt: createdAt,
      likes: likes,
      user: user,
      movieId: movieId
    );
  }

  static Review fromEntity(ReviewEntity entity) {

    return Review(
      id: entity.id,
      comment: entity.comment,
      stars: entity.stars,
      createdAt: entity.createdAt,
      likes: entity.likes,
      user: entity.user,
      movieId: entity.movieId
    );
  }

  bool get isEmpty => this == Review.empty;

  bool get isNotEmpty => this != Review.empty;

   @override
  String toString() {
    return '''ReviewEntity{id: $id, comment: $comment, stars: $stars, createdAt: $createdAt
    likes: $likes, user: $user, movieId: $movieId
    }''';
  }

  @override
  List<Object?> get props => [id, comment, stars, createdAt, likes, user, movieId];
  
}