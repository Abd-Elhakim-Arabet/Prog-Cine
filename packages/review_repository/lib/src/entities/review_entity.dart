import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:user_repository/user_repository.dart';

class ReviewEntity extends Equatable{
  String id;
  String comment;
  int stars;
  DateTime createdAt;
  int likes;
  MyUser user;
  String movieId;

  ReviewEntity({
    required this.id,
    required this.comment,
    required this.stars,
    required this.createdAt,
    required this.likes,
    required this.user,
    required this.movieId,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'comment': comment,
      'stars': stars,
      'createdAt': createdAt,
      'likes': likes,
      'user': user.toEntity().toJson(),
      'movieId': movieId,
    };
  }

  static ReviewEntity fromJson(Map<String, dynamic> doc) {

    return ReviewEntity(
      id: doc['id'] as String,
      comment: doc['comment'] as String,
      stars: doc['stars'] as int,
      createdAt:  (doc['createdAt'] as Timestamp).toDate(),
      likes: doc['likes'] as int,
      user: MyUser.fromEntity(MyUserEntity.fromJson(doc['user'])),
      movieId: doc['movieId'] as String,
    );
  }

  @override
  String toString() {
    return '''ReviewEntity{id: $id, comment: $comment, stars: $stars, createdAt: $createdAt
    likes: $likes, user: $user, movieId: $movieId
    }''';
  }

  @override
  List<Object?> get props => [id, comment, stars, createdAt, likes, user, movieId];

}