// To parse this JSON data, do
//
//     final sendNotification = sendNotificationFromJson(jsonString);

import 'dart:convert';

SendNotification sendNotificationFromJson(String str) =>
    SendNotification.fromJson(json.decode(str));

String sendNotificationToJson(SendNotification data) =>
    json.encode(data.toJson());

class SendNotification {
  SendNotification({
    this.date,
    this.message,
  });

  DateTime date;
  String message;

  factory SendNotification.fromJson(Map<String, dynamic> json) =>
      SendNotification(
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        message: json["message"] == null ? null : json["message"],
      );

  Map<String, dynamic> toJson() => {
        "date": date == null ? null : date.toIso8601String(),
        "message": message == null ? null : message,
      };
}
