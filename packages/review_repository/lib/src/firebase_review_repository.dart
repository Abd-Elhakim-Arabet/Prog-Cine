import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:review_repository/review_repository.dart';
import 'package:uuid/uuid.dart';

class FirebaseReviewRepository implements ReviewRepository {
  final reviewCollection = FirebaseFirestore.instance.collection('reviews');

  @override
  Future<Review> createReview(Review review) {
    try {
      review.id = const Uuid().v1();
      review.createdAt = DateTime.now();
      reviewCollection.doc(review.id).set(review.toEntity().toJson());
      return Future.value(review);
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

  @override
  Future<List<Review>> getReviews() {
    try {
      return reviewCollection.get().then((value) => value.docs
          .map((e) => Review.fromEntity(ReviewEntity.fromJson(e.data())))
          .toList());
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

  Future<String> deleteReview(
      String reviewId, String commenterId, String userId) {
    try {
      if (commenterId == userId) {
        reviewCollection.doc(reviewId).delete();
        return Future.value(reviewId);
      }
      return Future.error('You are not authorized to delete this review');
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }
}
