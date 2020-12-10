import 'package:flutter/material.dart';
import 'package:flutter_app_homeone/entity/SendNotification.dart';
import 'package:flutter_app_homeone/network/api_response.dart';
import 'package:flutter_app_homeone/repository/SendNotificationRepository.dart';

class SendNotificationProvider with ChangeNotifier {
  SendNotificationRepository _sendNotificationRepository;
  ApiResponse<SendNotification> _apiResponse;

  ApiResponse<SendNotification> get apiResponse => _apiResponse;

  SendNotificationProvider() {
    _sendNotificationRepository = SendNotificationRepository();
    sendNot();
  }

  sendNot(
      {String content,
      String image,
      String subject,
      String token,
      String additionalProp1,
      String additionalProp2,
      String additionalProp3}) async {
    _apiResponse = ApiResponse.loading("loading...  ");
    notifyListeners();
    try {
      SendNotification sendNotificationObject =
          await _sendNotificationRepository.sendNotification(
              content: content,
              image: image,
              subject: subject,
              token: token,
              additionalProp1: additionalProp1,
              additionalProp2: additionalProp2,
              additionalProp3: additionalProp3);
      _apiResponse = ApiResponse.completed(sendNotificationObject);
      notifyListeners();
    } catch (e) {
      _apiResponse = ApiResponse.error(e.toString());
      notifyListeners();
    }
  }
}
