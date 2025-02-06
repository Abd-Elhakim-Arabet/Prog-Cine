import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:review_repository/review_repository.dart';

part 'review_create_event.dart';
part 'review_create_state.dart';

class ReviewCreateBloc extends Bloc<ReviewCreateEvent, ReviewCreateState> {
  ReviewRepository _reviewRepository;
  ReviewCreateBloc({
    required ReviewRepository reviewRepository,
  }) : _reviewRepository = reviewRepository,
  super(ReviewCreateInitial()) {
    on<CreateReview>((event, emit) async {
      try {
        Review review = await _reviewRepository.createReview(event.review);
        emit(ReviewCreateSuccess(review));
      } catch (e) {
        emit(ReviewCreateFailure());
      }
    });
  }
}
