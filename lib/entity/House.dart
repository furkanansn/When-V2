// To parse this JSON data, do
//
//     final house = houseFromJson(jsonString);

import 'dart:convert';

List<House> houseFromJson(String str) => List<House>.from(json.decode(str).map((x) => House.fromJson(x)));

String houseToJson(List<House> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class House {
  House({
    this.id,
    this.title,
    this.eventImagePath,
    this.city,
    this.date,
    this.users,
  });

  int id;
  dynamic title;
  dynamic eventImagePath;
  String city;
  DateTime date;
  List<User> users;

  factory House.fromJson(Map<String, dynamic> json) => House(
    id: json["id"] == null ? null : json["id"],
    title: json["title"],
    eventImagePath: json["eventImagePath"],
    city: json["city"] == null ? null : json["city"],
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    users: json["users"] == null ? null : List<User>.from(json["users"].map((x) => User.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "title": title,
    "eventImagePath": eventImagePath,
    "city": city == null ? null : city,
    "date": date == null ? null : date.toIso8601String(),
    "users": users == null ? null : List<dynamic>.from(users.map((x) => x.toJson())),
  };
}

class User {
  User({
    this.id,
  });

  int id;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"] == null ? null : json["id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
  };
}
