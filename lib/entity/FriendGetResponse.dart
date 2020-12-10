// To parse this JSON data, do
//
//     final friendsGetResponse = friendsGetResponseFromJson(jsonString);

import 'dart:convert';

List<FriendsGetResponse> friendsGetResponseFromJson(String str) => List<FriendsGetResponse>.from(json.decode(str).map((x) => FriendsGetResponse.fromJson(x)));

String friendsGetResponseToJson(List<FriendsGetResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FriendsGetResponse {
  FriendsGetResponse({
    this.id,
    this.phone,
    this.username,
  });

  int id;
  String phone;
  String username;

  factory FriendsGetResponse.fromJson(Map<String, dynamic> json) => FriendsGetResponse(
    id: json["id"] == null ? null : json["id"],
    phone: json["phone"] == null ? null : json["phone"],
    username: json["username"] == null ? null : json["username"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "phone": phone == null ? null : phone,
    "username": username == null ? null : username,
  };
}
