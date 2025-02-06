import 'package:equatable/equatable.dart';

class MyUserEntity extends Equatable{
   final String id;
  final String email;
  final String name;
  final String? photoUrl;

  MyUserEntity({
    required this.id,
    required this.email,
    required this.name,
    this.photoUrl,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'photoUrl': photoUrl,
    };
  }

  static MyUserEntity fromJson(Map<String, dynamic> doc) {

    return MyUserEntity(
      id: doc['id'],
      email: doc['email'],
      name: doc['name'],
      photoUrl: doc['photoUrl'],
    );
  }

  String toString() {
    return 'MyUserEntity{id: $id, email: $email, name: $name, photoUrl: $photoUrl}';
  }

  @override
  List<Object?> get props => [id, email, name, photoUrl];

}