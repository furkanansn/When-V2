import 'dart:convert';

import 'file:///Users/furkanansin/Desktop/Flutter%20workspace/When-V2/lib/entity/Album.dart';
import 'package:flutter_app_homeone/network/api_path.dart';
import 'package:flutter_app_homeone/network/http_client.dart';
import 'package:http/http.dart' as http;

class AlbumRepository{
  Future<Album> fetchAlbumDetails() async{
    final response = await HttpClient.instance.fetchData(APIPathHelper.getValue(APIPath.fetch_album));

    return Album.fromJson(response);

  }
  Future<List<Album>> fetchAlbum() async{
    final response = await HttpClient.instance.fetchData(APIPathHelper.getValue(APIPath.fetch_all_album));
    return ((response) as List)
        .map((e) => Album.fromJson(e)).toList();

  }
}