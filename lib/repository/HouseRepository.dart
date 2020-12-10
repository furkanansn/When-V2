import 'package:flutter_app_homeone/network/http_client.dart';
import 'package:flutter_app_homeone/entity/House.dart';
import 'package:flutter_app_homeone/network/api_path.dart';

class HouseRepository{

    Future<List<House>> houseInitiliaze() async{
      final response = await HttpClient.instance.fetchData(APIPathHelper.getValue(APIPath.home));
      return ((response) as List)
          .map((e) => House.fromJson(e)).toList();
    }

}
