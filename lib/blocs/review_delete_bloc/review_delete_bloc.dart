import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:review_repository/review_repository.dart';

part 'review_delete_event.dart';
part 'review_delete_state.dart';

class ReviewDeleteBloc extends Bloc<ReviewDeleteEvent, ReviewDeleteState> {
  ReviewRepository _reviewRepository;
  ReviewDeleteBloc({
    required ReviewRepository reviewRepository,
  }) : _reviewRepository = reviewRepository,
  super(ReviewDeleteInitial()) {
    on<DeleteReview>((event, emit) async {
      try {
        String deleterId = await _reviewRepository.deleteReview(event.reviweId, event.commenterId, event.userId);
        emit(ReviewDeleteSuccess(deleterId));
      } catch (e) {
        emit(ReviewDeleteFailure());
      }
    });
  }
}
