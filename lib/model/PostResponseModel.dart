

import 'dart:convert';

List<PostsResponseModel> postsResponseModelFromJson(String str) => List<PostsResponseModel>.from(json.decode(str).map((x) => PostsResponseModel.fromJson(x)));

String postsResponseModelToJson(List<PostsResponseModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PostsResponseModel {
  PostsResponseModel({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  int? userId;
  int? id;
  String? title;
  String? body;

  factory PostsResponseModel.fromJson(Map<String, dynamic> json) => PostsResponseModel(
    userId: json["userId"] == null ? null : json["userId"],
    id: json["id"] == null ? null : json["id"],
    title: json["title"] == null ? null : json["title"],
    body: json["body"] == null ? null : json["body"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId == null ? null : userId,
    "id": id == null ? null : id,
    "title": title == null ? null : title,
    "body": body == null ? null : body,
  };
}
