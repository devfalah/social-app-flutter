import 'dart:convert';

class UserModel {
  int id;
  String username;
  String name;
  String email;
  String imageUrl;
  String bio;
  bool isVerfied;
  UserModel({
    this.id,
    this.username,
    this.name,
    this.email,
    this.imageUrl,
    this.bio,
    this.isVerfied,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'name': name,
      'email': email,
      'imageUrl': imageUrl,
      'bio': bio,
      'isVerfied': isVerfied,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] ?? '',
      username: map['username'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      bio: map['bio'] ?? '',
      isVerfied: map['isVerfied'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}
