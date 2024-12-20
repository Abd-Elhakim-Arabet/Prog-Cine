import 'package:equatable/equatable.dart';
import 'package:user_repository/user_repository.dart';

class MyUser extends Equatable {
  final String id;
  final String email;
  final String name;
  final String? photoUrl;

  MyUser({
    required this.id,
    required this.email,
    required this.name,
    this.photoUrl,
  });

  static var empty = MyUser(
    id: '',
   email: '', 
   name: '',
   photoUrl: ''
   );

  MyUser copyWith({
    String? id,
    String? email,
    String? name,
    String? photoUrl,
  }) {
    return MyUser(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      photoUrl: photoUrl ?? this.photoUrl,
    );
  }

  MyUserEntity toEntity() {
    return MyUserEntity(
      id: id,
      email: email,
      name: name,
      photoUrl: photoUrl,
    );
  }

  static MyUser fromEntity(MyUserEntity entity) {
    return MyUser(
      id: entity.id,
      email: entity.email,
      name: entity.name,
      photoUrl: entity.photoUrl,
    );
  }

  bool get isEmpty => this == MyUser.empty;

  bool get isNotEmpty => this != MyUser.empty;


  @override
  List<Object?> get props => [id, email, name, photoUrl];
  
}