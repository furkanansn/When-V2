import 'dart:convert';

import 'package:flutter_app_homeone/entity/SendNotification.dart';
import 'package:flutter_app_homeone/network/api_path.dart';
import 'package:flutter_app_homeone/network/http_client.dart';

class SendNotificationRepository {
  Future<SendNotification> sendNotification(
      {String content,
      String image,
      String subject,
      String token,
      String additionalProp1,
      String additionalProp2,
      String additionalProp3}) async {
    final response = await HttpClient.instance.postData(
        APIPathHelper.getValue(APIPath.send_notification) + "?token=$token",
        jsonEncode(<String, dynamic>{
          "content": content,
          "data": {
            "additionalProp1": additionalProp1,
            "additionalProp2": additionalProp2,
            "additionalProp3": additionalProp3
          },
          "image": image,
          "subject": subject
        }));

    return SendNotification.fromJson(response);
  }
}
