import 'package:firebase_auth/firebase_auth.dart';
import 'package:user_repository/user_repository.dart';

abstract class UserRepository {

  Stream<User?> get user;

  Future<void> signIn(String email, String password);

  Future<MyUser> signUp(MyUser myUser, String password);

  Future<void> logOut();

  Future<void> resetPassword(String email);

  Future<void> setUserData(MyUser myUser);

  Future<MyUser> getUserData(String myUserId);

  Future<String> uploadPicture(String file, String userId);

}