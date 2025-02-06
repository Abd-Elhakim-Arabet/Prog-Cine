part of 'review_delete_bloc.dart';

sealed class ReviewDeleteEvent extends Equatable {
  const ReviewDeleteEvent();

  @override
  List<Object> get props => [];
}

class DeleteReview extends ReviewDeleteEvent{
  final String reviweId;
  final String commenterId;
  final String userId;

  const DeleteReview(this.reviweId, this.commenterId, this.userId);

  @override

  List<Object> get props => [reviweId, commenterId, userId];

}



class DeleteReviewEvent extends ReviewDeleteEvent {

  final String reviweId;
  final String commenterId;
  final String userId;

  const DeleteReviewEvent(this.reviweId, this.commenterId, this.userId);



  @override

  List<Object> get props => [reviweId, commenterId, userId];

}