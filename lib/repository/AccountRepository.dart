import 'dart:convert';
import 'package:flutter_app_homeone/network/api_path.dart';
import 'package:flutter_app_homeone/network/http_client.dart';

class AccountRepository {
  Future<String> registerUserRepository(
      String email, String userName, String password) async {
    //return await _account.registerUser(email, userName, password);

    final response = await HttpClient.instance.postData(
        APIPathHelper.getValue(APIPath.register_user),
        jsonEncode(<String, String>{
          "email": email,
          "password": password,
          "userName": userName
        }));
    return response;
  }

  Future<String> changePasswordRepository(BigInt id) async {
    final response = await HttpClient.instance.fetchData(
        APIPathHelper.getValue(APIPath.change_password),
        params: {"id": id.toString()});
    return response;
  }

  Future<String> changePasswordByUserRepository(
      BigInt id, String password) async {
    final response = await HttpClient.instance.fetchData(
        APIPathHelper.getValue(APIPath.change_password_by_user),
        params: {"id": id.toString(), "password": password});
    return response;
  }

  Future<String> forgotPasswordRepository(String email) async {
    final response = await HttpClient.instance.fetchData(
        APIPathHelper.getValue(APIPath.forgot_password),
        params: {"email": email});
    return response;
  }

  Future<String> sendAgain(BigInt id) async {
    final response = await HttpClient.instance.fetchData(
        APIPathHelper.getValue(APIPath.send_again),
        params: {"id": id.toString()});
    return response;
  }
}
