part of 'review_get_bloc.dart';



sealed class ReviewGetEvent extends Equatable {
  const ReviewGetEvent();

  @override
  List<Object> get props => [];
}

class GetReviews extends ReviewGetEvent{

}