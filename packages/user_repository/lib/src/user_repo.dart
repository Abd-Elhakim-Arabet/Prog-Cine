import 'package:user_repository/user_repository.dart';

abstract class UserRepository {

  Future<void> signIn(String email, String password);
  Future<void> signUp(MyUser myUser, String password);
  Future<void> logOut();
  Future<void> resetPassword(String email);
}