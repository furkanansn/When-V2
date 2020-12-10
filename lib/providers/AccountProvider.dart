import 'package:flutter/material.dart';
import 'package:flutter_app_homeone/network/api_response.dart';
import 'package:flutter_app_homeone/repository/AccountRepository.dart';

class AccountProvider with ChangeNotifier {
  AccountRepository _accountRepository;

  ApiResponse<String> _apiResponse;

  ApiResponse<String> get apiResponse => _apiResponse;

  AccountProvider() {
    _accountRepository = AccountRepository();
    registerUser();
    changePassword();
    changePasswordByUser();
    forgotPassword();
    sendAgain();
  }

  registerUser({String email, String userName, String password}) async {
    _apiResponse = ApiResponse.loading("loading... ");
    notifyListeners();
    try {
      String response = (await _accountRepository.registerUserRepository(
          email, userName, password));
      _apiResponse = ApiResponse.completed(response);
      notifyListeners();
    } catch (e) {
      _apiResponse = ApiResponse.error(e.toString());
    }
  }

  void changePassword({BigInt id}) async {
    _apiResponse = ApiResponse.loading("loading... ");
    notifyListeners();
    try {
      String response = await _accountRepository.changePasswordRepository(id);
      _apiResponse = ApiResponse.completed(response);
      notifyListeners();
    } catch (e) {
      _apiResponse = ApiResponse.error(e.toString());
      notifyListeners();
    }
  }

  void changePasswordByUser({BigInt id, String password}) async{
    _apiResponse = ApiResponse.loading("loading... ");
    notifyListeners();
    try {
      String response = await _accountRepository.changePasswordByUserRepository(id, password);
      _apiResponse = ApiResponse.completed(response);
      notifyListeners();
    } catch (e) {
      _apiResponse = ApiResponse.error(e.toString());
      notifyListeners();
    }
  }

  void forgotPassword({String email}) async{
    _apiResponse = ApiResponse.loading("laoding... ");
    notifyListeners();
    try {
      String response = await _accountRepository.forgotPasswordRepository(email);
      _apiResponse = ApiResponse.completed(response);
      notifyListeners();
    } catch (e) {
      _apiResponse = ApiResponse.error(e.toString());
    }
  }

  void sendAgain({BigInt id}) async{
    _apiResponse = ApiResponse.loading("loading... ");
    notifyListeners();
    try {
      String response = await _accountRepository.sendAgain(id);
      _apiResponse = ApiResponse.completed(response);
      notifyListeners();
    } catch (e) {
      _apiResponse = ApiResponse.error(e.toString());
    }

  }
}
