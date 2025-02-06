part of 'review_delete_bloc.dart';

sealed class ReviewDeleteState extends Equatable {
  const ReviewDeleteState();
  
  @override
  List<Object> get props => [];
}

final class ReviewDeleteInitial extends ReviewDeleteState {}

final class ReviewDeleteFailure extends ReviewDeleteState {}
final class ReviewDeleteLoading extends ReviewDeleteState {}
final class ReviewDeleteSuccess extends ReviewDeleteState {
  final String deleterId;

  const ReviewDeleteSuccess(this.deleterId);
}
