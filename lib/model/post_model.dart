import 'dart:convert';

import 'package:socialapp/model/models.dart';

List<PostModel> postModelFromJson(String str) =>
    List<PostModel>.from(json.decode(str).map((x) => PostModel.fromMap(x)));

String postModelToJson(List<PostModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class PostModel {
  final int id;
  final int likes;
  final String description;
  final String image;
  final UserModel user;

  PostModel({
    this.id,
    this.likes,
    this.description,
    this.image,
    this.user,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'likes': likes,
      'description': description,
      'image': image,
    };
  }

  factory PostModel.fromMap(Map<String, dynamic> map) {
    return PostModel(
      id: map['id'],
      likes: map['Likes'],
      description: map['description'],
      image: map['imageUrl'],
      user: UserModel.fromMap(map['users_permissions_user']),
    );
  }
}
