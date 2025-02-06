part of 'review_create_bloc.dart';

sealed class ReviewCreateState extends Equatable {
  const ReviewCreateState();
  
  @override
  List<Object> get props => [];
}

final class ReviewCreateInitial extends ReviewCreateState {}

final class ReviewCreateFailure extends ReviewCreateState {}
final class ReviewCreateLoading extends ReviewCreateState {}
final class ReviewCreateSuccess extends ReviewCreateState {
  final Review review;

  const ReviewCreateSuccess(this.review);
}
