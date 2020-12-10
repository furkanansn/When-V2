// To parse this JSON data, do
//
//     final favPostResponse = favPostResponseFromJson(jsonString);

import 'dart:convert';

FavPostResponse favPostResponseFromJson(String str) => FavPostResponse.fromJson(json.decode(str));

String favPostResponseToJson(FavPostResponse data) => json.encode(data.toJson());

class FavPostResponse {
  FavPostResponse({
    this.eventsUserId,
    this.favStatus,
  });

  EventsUserId eventsUserId;
  String favStatus;

  factory FavPostResponse.fromJson(Map<String, dynamic> json) => FavPostResponse(
    eventsUserId: json["eventsUserId"] == null ? null : EventsUserId.fromJson(json["eventsUserId"]),
    favStatus: json["favStatus"] == null ? null : json["favStatus"],
  );

  Map<String, dynamic> toJson() => {
    "eventsUserId": eventsUserId == null ? null : eventsUserId.toJson(),
    "favStatus": favStatus == null ? null : favStatus,
  };
}

class EventsUserId {
  EventsUserId({
    this.eventId,
    this.userId,
  });

  int eventId;
  int userId;

  factory EventsUserId.fromJson(Map<String, dynamic> json) => EventsUserId(
    eventId: json["eventId"] == null ? null : json["eventId"],
    userId: json["userId"] == null ? null : json["userId"],
  );

  Map<String, dynamic> toJson() => {
    "eventId": eventId == null ? null : eventId,
    "userId": userId == null ? null : userId,
  };
}
