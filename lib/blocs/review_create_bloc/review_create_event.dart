part of 'review_create_bloc.dart';

sealed class ReviewCreateEvent extends Equatable {
  const ReviewCreateEvent();

  @override
  List<Object> get props => [];
}

class CreateReview extends ReviewCreateEvent{
  final Review review;

  const CreateReview(this.review);

  @override

  List<Object> get props => [review];

}



class CreateReviewEvent extends ReviewCreateEvent {

  final Review review;



  const CreateReviewEvent(this.review);



  @override

  List<Object> get props => [review];

}

