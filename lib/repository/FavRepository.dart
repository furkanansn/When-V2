import 'dart:convert';

import 'package:flutter_app_homeone/entity/FavGetResponse.dart';
import 'package:flutter_app_homeone/entity/FavPostResponse.dart';
import 'package:flutter_app_homeone/network/api_path.dart';
import 'package:flutter_app_homeone/network/http_client.dart';

class FavRepository {
  Future<FavPostResponse> favPostRepository(int eventId, int userId) async {
    final response = await HttpClient.instance.postData(
        APIPathHelper.getValue(APIPath.add_fav),
        jsonEncode(<String, dynamic>{
          "eventsUserId": {"eventId": eventId, "userId": userId},
          "favStatus": "string"
        }));
    return FavPostResponse.fromJson(response);
  }

  Future<FavPostResponse> favDeleteRepository(int eventId, int userId) async {
    final response = await HttpClient.instance.deleteData(
        APIPathHelper.getValue(APIPath.delete_fav),
        params: {"eventId": eventId.toString(), "userId": userId.toString()});
    return FavPostResponse.fromJson(response);
  }

  Future<List<FavGetResponse>> getUsersByEventIdRepository(int eventId) async {
    final response = await HttpClient.instance.fetchData(
        APIPathHelper.getValue(APIPath.get_users_by_event_id),
        params: {"eventId": eventId.toString()});
    return ((response) as List).map((e) => FavGetResponse.fromJson(e)).toList();
  }

  Future<List<FavGetResponse>> getUsersFromFavBySearchRepository(
      int eventId, String username) async {
    final response = await HttpClient.instance.fetchData(
        APIPathHelper.getValue(APIPath.get_users_from_fav_by_search),
        params: {"eventId": eventId.toString(), "username": username});
    return ((response) as List).map((e) => FavGetResponse.fromJson(e)).toList();
  }
}
