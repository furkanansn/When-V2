// To parse this JSON data, do
//
//     final favGetResponse = favGetResponseFromJson(jsonString);

import 'dart:convert';

List<FavGetResponse> favGetResponseFromJson(String str) => List<FavGetResponse>.from(json.decode(str).map((x) => FavGetResponse.fromJson(x)));

String favGetResponseToJson(List<FavGetResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FavGetResponse {
  FavGetResponse({
    this.age,
    this.bio,
    this.email,
    this.gender,
    this.id,
    this.nameSurname,
    this.photo,
    this.school,
    this.username,
  });

  int age;
  String bio;
  String email;
  String gender;
  int id;
  String nameSurname;
  String photo;
  String school;
  String username;

  factory FavGetResponse.fromJson(Map<String, dynamic> json) => FavGetResponse(
    age: json["age"] == null ? null : json["age"],
    bio: json["bio"] == null ? null : json["bio"],
    email: json["email"] == null ? null : json["email"],
    gender: json["gender"] == null ? null : json["gender"],
    id: json["id"] == null ? null : json["id"],
    nameSurname: json["nameSurname"] == null ? null : json["nameSurname"],
    photo: json["photo"] == null ? null : json["photo"],
    school: json["school"] == null ? null : json["school"],
    username: json["username"] == null ? null : json["username"],
  );

  Map<String, dynamic> toJson() => {
    "age": age == null ? null : age,
    "bio": bio == null ? null : bio,
    "email": email == null ? null : email,
    "gender": gender == null ? null : gender,
    "id": id == null ? null : id,
    "nameSurname": nameSurname == null ? null : nameSurname,
    "photo": photo == null ? null : photo,
    "school": school == null ? null : school,
    "username": username == null ? null : username,
  };
}
