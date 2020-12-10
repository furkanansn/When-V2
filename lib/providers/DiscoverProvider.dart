import 'package:flutter/material.dart';
import 'package:flutter_app_homeone/entity/Discover.dart';
import 'package:flutter_app_homeone/network/api_response.dart';
import 'package:flutter_app_homeone/repository/DiscoverRepository.dart';

class DiscoverProvider with ChangeNotifier {
  DiscoverRepository _discoverRepository;

  ApiResponse<List<Discover>> _discoverList;

  ApiResponse<List<Discover>> get discoverList => _discoverList;

  DiscoverProvider() {
    _discoverRepository = DiscoverRepository();
    fetchDiscoverItems();
  }

  fetchDiscoverItems({String cityName, String date}) async {
    _discoverList = ApiResponse.loading("loading... ");
    notifyListeners();
    try {
      List<Discover> discoverList =
          await _discoverRepository.dicoverInitilize(cityName, date);
      if (discoverList.isNotEmpty) {
        _discoverList = ApiResponse.completed(discoverList);
      } else {
        _discoverList = ApiResponse.nuLL("Veri yok");
      }
      notifyListeners();
    } catch (e) {
      _discoverList = ApiResponse.error(e.toString());
      notifyListeners();
    }
  }
}
