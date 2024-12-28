import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:review_repository/review_repository.dart';

part 'review_get_event.dart';
part 'review_get_state.dart';

class ReviewGetBloc extends Bloc<ReviewGetEvent, ReviewGetState> {
  ReviewRepository _reviewRepository;
  ReviewGetBloc({
    required ReviewRepository reviewRepository,
  })  : _reviewRepository = reviewRepository,
        super(ReviewGetInitial()) {
    on<GetReviews>((event, emit) async {
      emit(ReviewGetLoading());
      try {
        List<Review> reviews = await _reviewRepository.getReviews();
        emit(ReviewGetSuccess(reviews));
      } catch (e) {
        emit(ReviewGeFailure());
      }
    });
  }
}
