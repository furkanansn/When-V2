import 'package:flutter/material.dart';
import 'package:flutter_app_homeone/entity/FavGetResponse.dart';
import 'package:flutter_app_homeone/entity/FavPostResponse.dart';
import 'package:flutter_app_homeone/network/api_response.dart';
import 'package:flutter_app_homeone/repository/FavRepository.dart';

class FavProvider with ChangeNotifier {
  FavRepository _favRepository;
  ApiResponse<FavPostResponse> _favPostResponse;
  ApiResponse<List<FavGetResponse>> _favGetResponse;

  ApiResponse<FavPostResponse> get favPostRes => _favPostResponse;
  ApiResponse<List<FavGetResponse>> get favGetRes => _favGetResponse;

  FavProvider() {
    _favRepository = FavRepository();
    postFav();
    deleteFav();
    getFavs();
    getFavsSearch();
  }

  void postFav({int eventId, int userId}) async {
    _favPostResponse = ApiResponse.loading("loading... ");
    notifyListeners();
    try {
      FavPostResponse favPostResponse =
          await _favRepository.favPostRepository(eventId, userId);
      _favPostResponse = ApiResponse.completed(favPostResponse);
      notifyListeners();
    } catch (e) {
      _favPostResponse = ApiResponse.error(e.toString());
    }
  }

  void getFavsSearch({int eventId, String username}) async {
    _favGetResponse = ApiResponse.loading("loading... ");
    notifyListeners();
    try {
      List<FavGetResponse> list = await _favRepository
          .getUsersFromFavBySearchRepository(eventId, username);
      if (list.isNotEmpty) {
        _favGetResponse = ApiResponse.completed(list);
      } else {
        _favGetResponse = ApiResponse.nuLL("Böyle bir veri bulunamadı");
      }
      notifyListeners();
    } catch (e) {
      _favGetResponse = ApiResponse.error(e.toString());
      notifyListeners();
    }
  }

  void getFavs({int eventId}) async {
    _favGetResponse = ApiResponse.loading("loading... ");
    notifyListeners();
    try {
      List<FavGetResponse> list =
          await _favRepository.getUsersByEventIdRepository(eventId);
      if (list.isNotEmpty) {
        _favGetResponse = ApiResponse.completed(list);
      } else {
        _favGetResponse = ApiResponse.nuLL("Böyle bir veri bulunamadı");
      }
      notifyListeners();
    } catch (e) {
      _favGetResponse = ApiResponse.error(e.toString());
      notifyListeners();
    }
  }

  void deleteFav({int eventId, int userId}) async {
    _favPostResponse = ApiResponse.loading("loading... ");
    notifyListeners();
    try {
      FavPostResponse favPostResponse =
          await _favRepository.favDeleteRepository(eventId, userId);
      _favPostResponse = ApiResponse.completed(favPostResponse);
      notifyListeners();
    } catch (e) {
      _favPostResponse = ApiResponse.error(e.toString());
    }
  }
}
