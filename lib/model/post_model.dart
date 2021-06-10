import 'dart:convert';

import 'package:socialapp/model/models.dart';

List<PostModel> postModelFromJson(String str) =>
    List<PostModel>.from(json.decode(str).map((x) => PostModel.fromMap(x)));

class PostModel {
  final int id;
  final String description;
  final String image;
  final UserModel user;
  List<dynamic> comments;

  PostModel({
    this.id,
    this.description,
    this.image,
    this.user,
    this.comments,
  });

  factory PostModel.fromMap(Map<String, dynamic> map) {
    return PostModel(
      id: map['id'] ?? 0,
      description: map['description'] ?? '',
      image: map['imageUrl'] ?? '',
      user: UserModel.fromMap(map['users_permissions_user']) ?? UserModel(),
      comments: List<dynamic>.from(map['comments']),
    );
  }
}
