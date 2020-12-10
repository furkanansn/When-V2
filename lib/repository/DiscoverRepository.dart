import 'package:flutter_app_homeone/entity/Discover.dart';
import 'package:flutter_app_homeone/network/api_path.dart';
import 'package:flutter_app_homeone/network/http_client.dart';

class DiscoverRepository{

   Future<List<Discover>> dicoverInitilize(String cityName,String date) async{
     final response = await HttpClient.instance.fetchData(APIPathHelper.getValue(APIPath.discover),params: {"cityName": cityName,"date" : date});
     return response;
    }
}