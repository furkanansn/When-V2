// To parse this JSON data, do
//
//     final discover = discoverFromJson(jsonString);

import 'dart:convert';

List<Discover> discoverFromJson(String str) => List<Discover>.from(json.decode(str).map((x) => Discover.fromJson(x)));

String discoverToJson(List<Discover> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Discover {
  Discover({
    this.city,
    this.date,
    this.eventImagePath,
    this.id,
    this.title,
    this.users,
  });

  String city;
  DateTime date;
  String eventImagePath;
  int id;
  String title;
  List<User> users;

  factory Discover.fromJson(Map<String, dynamic> json) => Discover(
    city: json["city"] == null ? null : json["city"],
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    eventImagePath: json["eventImagePath"] == null ? null : json["eventImagePath"],
    id: json["id"] == null ? null : json["id"],
    title: json["title"] == null ? null : json["title"],
    users: json["users"] == null ? null : List<User>.from(json["users"].map((x) => User.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "city": city == null ? null : city,
    "date": date == null ? null : date.toIso8601String(),
    "eventImagePath": eventImagePath == null ? null : eventImagePath,
    "id": id == null ? null : id,
    "title": title == null ? null : title,
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
