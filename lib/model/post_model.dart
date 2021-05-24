import 'dart:convert';

List<PostModel> postModelFromJson(String str) =>
    List<PostModel>.from(json.decode(str).map((x) => PostModel.fromJson(x)));

String postModelToJson(List<PostModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PostModel {
  PostModel({
    this.id,
    this.description,
    this.image,
  });

  final int id;
  final String description;
  final String image;

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
        id: json["id"],
        description: json["description"],
        image: json["imageUrl"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "description": description,
        "image": image,
      };
}
