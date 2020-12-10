import 'package:flutter/cupertino.dart';
import 'package:flutter_app_homeone/entity/House.dart';
import 'package:flutter_app_homeone/network/api_response.dart';
import 'package:flutter_app_homeone/repository/HouseRepository.dart';

class HouseProvider with  ChangeNotifier{

  HouseRepository _houseRepository;

  ApiResponse<List<House>> _houseList;

  ApiResponse<List<House>> get houseList => _houseList;

  HouseProvider(){
    _houseRepository = HouseRepository();
    fetchHouseItems();
  }

  fetchHouseItems() async{
    _houseList = ApiResponse.loading("loading... ");
    notifyListeners();
    try{
      List<House> houseList = await _houseRepository.houseInitiliaze();
      if(houseList.isNotEmpty) {
        _houseList = ApiResponse.completed(houseList);
      }else{
        _houseList = ApiResponse.nuLL("Veri yok");
      }
      notifyListeners();
    }catch(e){
      _houseList = ApiResponse.error(e.toString());
      notifyListeners();
    }
  }

}