part of 'review_get_bloc.dart';

sealed class ReviewGetState extends Equatable {
  const ReviewGetState();

  @override
  List<Object> get props => [];
}

final class ReviewGetInitial extends ReviewGetState {}

final class ReviewGetLoading extends ReviewGetState {}

final class ReviewGeFailure extends ReviewGetState {}

final class ReviewGetSuccess extends ReviewGetState {
  final List<Review> reviews;

  const ReviewGetSuccess(this.reviews);
}
