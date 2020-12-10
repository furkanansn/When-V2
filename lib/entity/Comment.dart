// To parse this JSON data, do
//
//     final comment = commentFromJson(jsonString);

import 'dart:convert';

List<Comment> commentFromJson(String str) => List<Comment>.from(json.decode(str).map((x) => Comment.fromJson(x)));

String commentToJson(List<Comment> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Comment {
  Comment({
    this.comment,
    this.createdAt,
    this.updatedAt,
    this.users,
  });

  String comment;
  DateTime createdAt;
  DateTime updatedAt;
  Users users;

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
    comment: json["comment"] == null ? null : json["comment"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    users: json["users"] == null ? null : Users.fromJson(json["users"]),
  );

  Map<String, dynamic> toJson() => {
    "comment": comment == null ? null : comment,
    "created_at": createdAt == null ? null : createdAt.toIso8601String(),
    "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
    "users": users == null ? null : users.toJson(),
  };
}

class Users {
  Users({
    this.firebaseId,
    this.id,
    this.username,
  });

  String firebaseId;
  int id;
  String username;

  factory Users.fromJson(Map<String, dynamic> json) => Users(
    firebaseId: json["firebaseId"] == null ? null : json["firebaseId"],
    id: json["id"] == null ? null : json["id"],
    username: json["username"] == null ? null : json["username"],
  );

  Map<String, dynamic> toJson() => {
    "firebaseId": firebaseId == null ? null : firebaseId,
    "id": id == null ? null : id,
    "username": username == null ? null : username,
  };
}
