// To parse this JSON data, do
//
//     final commentModel = commentModelFromJson(jsonString);

import 'dart:convert';

import 'models.dart';

List<CommentModel> commentModelFromJson(String str) => List<CommentModel>.from(
    json.decode(str).map((x) => CommentModel.fromJson(x)));

String commentModelToJson(List<CommentModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CommentModel {
  CommentModel({
    this.id,
    this.user,
    this.post,
    this.content,
  });

  final int id;
  final UserModel user;
  final int post;
  final String content;

  factory CommentModel.fromJson(Map<String, dynamic> json) => CommentModel(
        id: json["id"],
        user: json['users_permissions_user'],
        post: json["post"],
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "users_permissions_user": user,
        "post": post,
        "content": content,
      };
}
