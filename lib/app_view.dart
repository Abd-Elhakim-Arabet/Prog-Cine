import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prog/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:prog/blocs/movie_page_bloc/movies_page_bloc.dart';
import 'package:prog/blocs/my_user_bloc/my_user_bloc.dart';
import 'package:prog/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:prog/blocs/update_user_info_bloc/update_user_info_bloc.dart';
import 'package:prog/pages/dashboard/mini_dashboard.dart';
import 'package:prog/pages/auth/auth_page.dart';
import 'package:prog/pages/testing/test_functions.dart';
import 'package:prog/pages/testing/test_reviews.dart';
import 'package:prog/services/data/dummy_data.dart';
import 'package:prog/pages/utillity%20pages/pages_navigator.dart';
import 'package:prog/pages/auth/reset_password.dart';
import 'package:prog/pages/movies/movie_description.dart';
import 'package:prog/pages/testing/test_db.dart';

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MyUserBloc>(
      create: (context) => MyUserBloc(
        myUserRepository: context.read<AuthenticationBloc>().userRepository,
      ),
      child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>( 
        builder: (context, state) {
          if (state.status == AuthenticationStatus.authenticated) {
            return StreamBuilder<User?>(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasData) {
                  context.read<MyUserBloc>().add(GetMyUser(
                      myUserId: context.read<AuthenticationBloc>().state.user!.uid
										));
                  return  MultiBlocProvider(
								providers: [
                  BlocProvider(
                    create: (_)=> MoviesPageBloc()),
									BlocProvider(
										create: (context) => SignInBloc(
											myUserRepository: context.read<AuthenticationBloc>().userRepository,
										),
									),
									BlocProvider(
										create: (context) => UpdateUserInfoBloc(
											userRepository: context.read<AuthenticationBloc>().userRepository
										),
									), 
								],
							child: const pagesNavigator(),
						);
                } else {
                  return authPage();
                }
              },
            );
          } else {
            return authPage();
          }
        },
      ),
      routes: {
        "/testDB": (context) => TestDb(),
        "/resetPassword": (context) => resetPassword(),
        "/auth": (context) => authPage(),
      },
    ));
  }
}