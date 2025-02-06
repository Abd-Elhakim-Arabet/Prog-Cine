import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prog/assets/colors.dart';
import 'package:prog/blocs/my_user_bloc/my_user_bloc.dart';
import 'package:prog/components/single_use/movie_description/post_comment.dart';
import 'package:review_repository/review_repository.dart';

class TestReviews extends StatefulWidget {
  const TestReviews({super.key});

  @override
  State<TestReviews> createState() => _TestReviewsState();
}

class _TestReviewsState extends State<TestReviews> {
  //late Review review;

  @override
  void initState() {
    //review = Review.empty;
   // review.user = context.read<MyUserBloc>().state.user!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //print(review.user!.name);

    return Scaffold(
      backgroundColor: AppColors.myBackground,
      body: Column(
        children: [
        ],
      ),
    );
  }
}
