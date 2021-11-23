// To parse this JSON data, do
//
//     final modelPost = modelPostFromJson(jsonString);

import 'dart:convert';

List<ModelPost> modelPostFromJson(String str) => List<ModelPost>.from(json.decode(str).map((x) => ModelPost.fromJson(x)));

String modelPostToJson(List<ModelPost> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelPost {
  ModelPost({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  int userId;
  int id;
  String title;
  String body;

  factory ModelPost.fromJson(Map<String, dynamic> json){
    return ModelPost(
      userId: json["userId"],
      id: json["id"],
      title: json["title"],
      body: json["body"],
    );
  }

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "id": id,
    "title": title,
    "body": body,
  };
}
