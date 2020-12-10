import 'dart:convert';

import 'package:flutter_app_homeone/entity/FriendGetResponse.dart';
import 'package:flutter_app_homeone/network/api_base.dart';
import 'package:flutter_app_homeone/network/api_path.dart';
import 'package:flutter_app_homeone/network/http_client.dart';

class FriendRepository {
  Future<String> friendPostRepository(int userId, int otherUserId) async {
    final response = await HttpClient.instance.postData(
        APIPathHelper.getValue(APIPath.add_friend),
        jsonEncode(<String, dynamic>{
          "createdAt": "2020-12-08T21:05:04.435Z",
          "friendOne": userId,
          "friendTwo": otherUserId,
          "friendsStatus": "ACTIVE",
          "id": "",
          "updatedAt": "2020-12-08T21:05:04.435Z"
        }));
    return response;
  }

  //backendin güncellenmesi lazım
  /*Future<String> friendDeleteRepository(int userId,int otherUserId) async{
    final response = await HttpClient.instance.deleteData(APIPathHelper.getValue(APIPath.delete_friend),params: {"eventId": eventId.toString(),"userId":userId.toString()});
    return FavPostResponse.fromJson(response);  }*/
  Future<String> friendUpdateRepository(int userId, int otherUserId) async {
    final response = await HttpClient.instance.updateData(
        APIPathHelper.getValue(APIPath.update_friend),
        jsonEncode(<String, dynamic>{
          "createdAt": "2020-12-10T13:55:57.330Z",
          "friendOne": 0,
          "friendTwo": 0,
          "friendsStatus": "ACTIVE",
          "id": 0,
          "updatedAt": "2020-12-10T13:55:57.330Z"
        }));
  }

  //backendin güncellenmesi lazım
  Future<List<FriendsGetResponse>> getFriendsRepository(int userId) async {
    final response = await HttpClient.instance.fetchData(
        APIPathHelper.getValue(APIPath.get_friends),
        params: {"userId": userId.toString()});
    return ((response) as List)
        .map((e) => FriendsGetResponse.fromJson(e))
        .toList();
  }

  Future<List<FriendsGetResponse>> getFriendsBySearchRepository(
      int userId, String username) async {
    final response = await HttpClient.instance.fetchData(
        APIPathHelper.getValue(APIPath.get_friends_by_search),
        params: {"userId": userId.toString(), "userName": username});

    return ((response) as List)
        .map((e) => FriendsGetResponse.fromJson(e))
        .toList();
  }
}
