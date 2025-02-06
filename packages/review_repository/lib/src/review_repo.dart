import 'package:review_repository/review_repository.dart';

abstract class ReviewRepository {

  Future<Review> createReview(Review review);

  Future<List<Review>> getReviews();

  Future<String> deleteReview(String reviewId, String reviewerId, String userId);
}
